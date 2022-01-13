using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class OwnDictionary:IOwnDictionary
    {
        private ConcurrentDictionary<RequestDTO, List<ExchangeRate>> _dictionary;

        public OwnDictionary()
        {
            _dictionary = new ConcurrentDictionary<RequestDTO, List<ExchangeRate>>();
        }

        public ConcurrentDictionary<RequestDTO, List<ExchangeRate>> GetDictionary()
        {
            return _dictionary;
        }
    }
}
