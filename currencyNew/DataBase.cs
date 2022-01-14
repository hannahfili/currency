using AutoMapper;
using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class DataBase
    {
        private MyDbContext _myDbContext;
        private IMapper _mapper;

        public DataBase(MyDbContext myDbContext, IMapper mapper)
        {
            _myDbContext = myDbContext;
            _mapper = mapper;
        }

        public object SaveNewRequest(UriRequestData uriRequestData, List<ExchangeRate> exrDTOs, DateTime requestDate)
        {
            RequestForCreationDTO requestForCreationDTO = new RequestForCreationDTO(uriRequestData);
            Request request = _mapper.Map<Request>(requestForCreationDTO);
            request.RequestDate = requestDate;            

            request.ExchangeRates = new List<ExchangeRate>();

            foreach (var elem in exrDTOs) {
                request.ExchangeRates.Add(elem);
            }
            //Console.WriteLine("SAVE REQUEST");
            //foreach (var e in request.ExchangeRates) Console.WriteLine(e.ToString());
            //Console.WriteLine("------------------------------");

            try
            {
                _myDbContext.Requests.Add(request);
                _myDbContext.SaveChanges();
                return CheckIfRequestExistsInDataBase(new RequestDTO(uriRequestData));

            }
            catch(Exception e)
            {
                Console.WriteLine($"save request err: {e.Message}");
            }
            return null;

        }
        
        
        public Object CheckIfRequestExistsInDataBase(RequestDTO requestDTO)
        {
            try
            {
                var result = _myDbContext.Requests
                .Where(req =>
                req.StartDate == requestDTO.StartDate
                && req.EndDate == requestDTO.EndDate
                && req.BaseCurrency == requestDTO.BaseCurrency
                && req.QuotedCurrency == requestDTO.QuotedCurrency)
                .FirstOrDefault();

                if (result == null) return null;
                return result.Id;
            }
            catch (Exception)
            {
            }
            return null;
        }

        public object GetRequestDate(Guid requestId)
        {
            try
            {
                var result = _myDbContext.Requests
               .Where(req => req.Id == requestId).FirstOrDefault();
                return result.RequestDate;
            }
            catch (Exception)
            {

            }
            return null;
        }
        public IEnumerable<ExchangeRate> GetExchangeRates(Guid requestId)
        {
            try
            {
                var result = _myDbContext.ExchangeRates
               .Where(exr => exr.RequestId == requestId);

                return result.ToList();
            }
            catch (Exception)
            {

            }

            return null;
        }
        public void UpdateRequestDate(Guid requestId)
        {
            try
            {
                var result = _myDbContext.Requests
               .Where(req => req.Id == requestId).FirstOrDefault();
                result.RequestDate = DateTime.Now;

                _myDbContext.SaveChanges();
            }
            catch (Exception)
            {

            }

        }
        public object GetRequestId(RequestDTO requestDTO)
        {
            try
            {
                var result = _myDbContext.Requests
                .Where(req =>
                req.StartDate == requestDTO.StartDate
                && req.EndDate == requestDTO.EndDate
                && req.BaseCurrency == requestDTO.BaseCurrency
                && req.QuotedCurrency == requestDTO.QuotedCurrency)
                .FirstOrDefault();

                if (result == null) return null;
                return result.Id;
            }
            catch (Exception)
            {
            }
            return null;
        }

    }
}
