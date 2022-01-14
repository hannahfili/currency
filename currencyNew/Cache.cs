using AutoMapper;
using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class Cache
    {
        private ConcurrentDictionary<RequestDTO, List<ExchangeRate>> _dictionary;//=new ConcurrentDictionary<RequestDTO, List<ExchangeRate>>();
        private IMapper _mapper;       

        public Cache(ConcurrentDictionary<RequestDTO, List<ExchangeRate>> dictionary, IMapper mapper)
        {
            _dictionary = dictionary;
            _mapper = mapper;
        }
        

        public RequestDTO CheckIfRequestExistsInCache(RequestDTO requestDTO)
        {
            RequestDTO requestToFind = new RequestDTO();

            foreach(var entry in _dictionary)
            {
                if (entry.Key.Equals(requestDTO))
                {
                    requestToFind = entry.Key;
                    return requestToFind;
                }
            }
            return null;
        }

        public List<ExchangeRate> GetExchangeRates(RequestDTO requestDTO)
        {
            List<ExchangeRate> exchangeRates;
            //if (requestDTO is null) Console.WriteLine("REQUESTDTO IS NULL!!!!!");
            bool exchangeRateExist = _dictionary.TryGetValue(requestDTO, out exchangeRates);
            if (exchangeRateExist) return exchangeRates;
            return null;
        }
        public RequestDTO UpdateRequestDate(RequestDTO requestDTO)
        {
            List<ExchangeRate> value;
            RequestDTO newRequestDTO = (RequestDTO)requestDTO.Clone();
            newRequestDTO.RequestDate = DateTime.Now;
            //Console.WriteLine("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
            //Console.WriteLine("dictionary przed updatem daty");
            //foreach (var entry in _dictionary)
            //{
            //    Console.WriteLine(entry.Key.ToString());
            //    //foreach (var elem in entry.Value) Console.WriteLine(elem.ToString());
            //}

            if (_dictionary.TryRemove(requestDTO, out value))
            {
                //Console.WriteLine("udalo sie usunac stary wpis");
                //Console.WriteLine("%%%%%%%%%%%%%%%%%%%%%%%%%%%");
                //Console.WriteLine("dictionary po usunieciu wpisu");
                //foreach (var entry in _dictionary)
                //{
                //    Console.WriteLine(entry.Key.ToString());
                //    //foreach (var elem in entry.Value) Console.WriteLine(elem.ToString());
                //}
                _dictionary.TryAdd(newRequestDTO, value);

                //Console.WriteLine("++++++++++++++++++++++++++");
                //Console.WriteLine("dictionary po dodaniu nowego wpisu");
                //foreach (var entry in _dictionary)
                //{
                //    Console.WriteLine(entry.Key.ToString());
                //    //foreach (var elem in entry.Value) Console.WriteLine(elem.ToString());
                //}
                return newRequestDTO;
            }
            return null;
            

        }
        public List<ExchangeRate> SaveExchangeRateList(RequestDTO requestDTO, List<UriExchangeRateData> uriExchangeRateDatas)
        {
            List<ExchangeRate> convertedData = Helper.convertUriDataToExchangeRate(uriExchangeRateDatas);
            
            AddItemToDictionary(requestDTO, convertedData);
            return convertedData;

        }
        
        public void AddItemToDictionary(RequestDTO requestDTO, List<ExchangeRate> resultFromDataBase)
        {

            int maxValue = 10, n = 1;
            Console.WriteLine("DICTIONARY COUNT"+_dictionary.Count());
            foreach (var entry in _dictionary)
            {
                Console.WriteLine(n + " " + entry.Key.ToString());
                //foreach (var elem in entry.Value) Console.WriteLine(elem.ToString());
                n++;
            }
            Console.WriteLine("$$$$$$$$$$$$$$$$$$$$$$$$");
            if (_dictionary.Count() == maxValue)
            {
                RemoveTheOldestItemFromDictionary();
            }

            _dictionary.TryAdd(requestDTO, resultFromDataBase);
        }
        public void RemoveTheOldestItemFromDictionary()
        {
            
            RequestDTO keyToDelete = _dictionary.Keys.FirstOrDefault();

            foreach (var item in _dictionary)
            {
                if (DateTime.Compare(item.Key.RequestDate, keyToDelete.RequestDate) < 0)
                {
                    
                    keyToDelete = item.Key;
                }

            }
            //Console.WriteLine($"KEY TO DELETE: {keyToDelete}");
            List<ExchangeRate> valuesDeleted;
            _dictionary.TryRemove(keyToDelete, out valuesDeleted);
        }

    }
}
