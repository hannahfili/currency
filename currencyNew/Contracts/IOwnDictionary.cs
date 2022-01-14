using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public interface IOwnDictionary

    {
        public ConcurrentDictionary<RequestDTO, List<ExchangeRate>> GetDictionary();

    }
}

