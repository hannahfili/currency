using AutoMapper;
using currencyNew.Contracts;
using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class RequestRepository
    {
        private MyDbContext _myDbContext;
        private IMapper _mapper;
        private ConcurrentDictionary<RequestDTO, List<ExchangeRate>> _dictionary;

        public RequestRepository(MyDbContext myDbContext, IMapper mapper, ConcurrentDictionary<RequestDTO, List<ExchangeRate>> dictionary)
        {
            _myDbContext = myDbContext;
            _mapper = mapper;
            _dictionary = dictionary;
        }

        public async Task<Object> Get(UriRequestData uriRequestData)
        {
            List<ExchangeRate> finalResult = new List<ExchangeRate>();
            Cache cache = new Cache(_dictionary, _mapper);

            //check correctness of the input URI
            if (!DataChecker.checkDateTimeFormats(uriRequestData.StartDate, uriRequestData.EndDate)) return new Result("badRequest", "dateTime formats are incorrect");
            if (DataChecker.dateTimeIsFuture(uriRequestData.StartDate) || DataChecker.dateTimeIsFuture(uriRequestData.EndDate)) return new Result("notFound", "startDate or endDate is future date");
            if (!DataChecker.endLaterThanStart(uriRequestData)) return new Result("badRequest","startDate is later than endDate");


            ////check cache first
            RequestDTO requestDTO = new RequestDTO(uriRequestData);
            var resultFromCache = CheckAndUpdateCache(requestDTO, cache);
            if (resultFromCache is List<ExchangeRate>)
            {
                finalResult = (List<ExchangeRate>)resultFromCache;

                Console.WriteLine("-------------------------");
                Console.WriteLine("WYNIKI Z CACHE'A");
                Console.WriteLine(finalResult[0].Request.ToString());

                foreach (var elem in finalResult)
                {
                    Console.WriteLine(elem.ToString());
                }
                Console.WriteLine("-------------------------");
                return finalResult;
            }

            // check database second
            DataBase dbRepository = new DataBase(_myDbContext, _mapper);
            List<ExchangeRate> resultFromDataBase = new List<ExchangeRate>();
            var requestId = CheckAndUpdateDataBase(requestDTO, dbRepository);
            if (requestId is Guid)
            {
                requestDTO.RequestDate = (DateTime)dbRepository.GetRequestDate((Guid)requestId);
                resultFromDataBase = (List<ExchangeRate>)dbRepository.GetExchangeRates((Guid)requestId);
                requestDTO.Id = (Guid)requestId;
                cache.AddItemToDictionary(requestDTO, resultFromDataBase);
                finalResult = (List<ExchangeRate>)resultFromDataBase;

                Console.WriteLine("-------------------------");
                Console.WriteLine("WYNIKI Z BAZY DANYCH");
                Console.WriteLine(finalResult[0].Request.ToString());

                foreach (var elem in finalResult)
                {
                    Console.WriteLine(elem.ToString());
                }
                Console.WriteLine("-------------------------");

                return finalResult;
            }

            //get data from external API

            bool baseCurrencyIsEuro = uriRequestData.BaseCurrency.ToUpper() == "EUR" ? true : false;
            bool quotedCurrencyIsEuro = uriRequestData.QuotedCurrency.ToUpper() == "EUR" ? true : false;

            var resultFromAPI = new object();
            //Console.WriteLine("POBIERAM DANE Z EXTERNAL API");

            if (baseCurrencyIsEuro && !quotedCurrencyIsEuro) resultFromAPI = await DataKeeper.GetMonoDataFromExternalAPI(uriRequestData);
            else if (!baseCurrencyIsEuro && quotedCurrencyIsEuro) resultFromAPI = await DataKeeper.GetMonoDataFromExternalAPI(uriRequestData, true);
            else if (!baseCurrencyIsEuro && !quotedCurrencyIsEuro) resultFromAPI = await DataKeeper.GetDoubleDataFromExternalAPI(uriRequestData);
            else return new Result("badRequest", "uri is not correct");

            List<UriExchangeRateData> finalResultFromAPI = new List<UriExchangeRateData>();
            List<ExchangeRate> convertedData = new List<ExchangeRate>();


            if (resultFromAPI is List<UriExchangeRateData>)
            {
                finalResultFromAPI = (List<UriExchangeRateData>)resultFromAPI;
                DateTime requestDate = DateTime.Now;
                requestDTO.RequestDate = requestDate;

                foreach (var entry in finalResultFromAPI) Console.WriteLine(entry.ToString());

                convertedData = Helper.convertUriDataToExchangeRate(finalResultFromAPI);



                requestDTO.Id = (Guid)dbRepository.SaveNewRequest(uriRequestData, convertedData, requestDate);
                resultFromDataBase = (List<ExchangeRate>)dbRepository.GetExchangeRates(requestDTO.Id);
                cache.AddItemToDictionary(requestDTO, resultFromDataBase);




                //Console.WriteLine("-------------------------");
                //Console.WriteLine("SPRAWDZAM ZAPIS Z CACHE'A");
                //foreach (var entry in _dictionary)
                //{
                //    Console.WriteLine(entry.Key.ToString());
                //    foreach (var elem in entry.Value) Console.WriteLine(elem.ToString());
                //}
                //Console.WriteLine("SPRAWDZAM ZAPIS Z CACHE'A");
                //Console.WriteLine("@@@@@@@@@@@@@@@@@@@@@@@@@@");
            }


            return convertedData;
        }

        public object CheckAndUpdateDataBase(RequestDTO requestDTO, DataBase dbRepository)
        {
            
            var searchedRequestId = dbRepository.CheckIfRequestExistsInDataBase(requestDTO);

            if (searchedRequestId is Guid)
            {
                dbRepository.UpdateRequestDate((Guid)searchedRequestId);
                return (Guid)searchedRequestId;
            }
            return null;

        }
        public List<ExchangeRate> CheckAndUpdateCache(RequestDTO requestDTO, Cache cache)
        {
            RequestDTO searchedRequest= cache.CheckIfRequestExistsInCache(requestDTO);
            if(searchedRequest is null)
            {
                Console.WriteLine("searched request is null");
                return null;
            }
            else
            {
                
                //Console.WriteLine("updating requestDate");
                RequestDTO requestDTOupdated=cache.UpdateRequestDate(searchedRequest);
                if(requestDTOupdated is not null) return cache.GetExchangeRates(requestDTOupdated);
                return null;
            }
            
        }
        


    }
}
