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
        private ConcurrentDictionary<RequestDTO, List<ExchangeRate>> _dictionary;
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
            bool exchangeRateExist = _dictionary.TryGetValue(requestDTO, out exchangeRates);
            if (exchangeRateExist) return exchangeRates;
            return null;
        }
        public RequestDTO UpdateRequestDate(RequestDTO requestDTO)
        {
            List<ExchangeRate> value;
            RequestDTO newRequestDTO = (RequestDTO)requestDTO.Clone();
            newRequestDTO.RequestDate = DateTime.Now;
            

            if (_dictionary.TryRemove(requestDTO, out value))
            {
                
                _dictionary.TryAdd(newRequestDTO, value);

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
            List<ExchangeRate> valuesDeleted;
            _dictionary.TryRemove(keyToDelete, out valuesDeleted);
        }

    }
}
