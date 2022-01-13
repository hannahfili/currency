using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.DataTransferObjects
{
    public class RequestHelper
    {
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string BaseCurrency { get; set; }
        public string QuotedCurrency { get; set; }

        public RequestHelper(DateTime startDate, DateTime endDate, string baseCurrency, string quotedCurrency)
        {
            StartDate = startDate;
            EndDate = endDate;
            BaseCurrency = baseCurrency;
            QuotedCurrency = quotedCurrency;
        }
        public RequestHelper(UriRequestData uriRequestData)
        {
            StartDate = DateTime.Parse(uriRequestData.StartDate);
            EndDate = DateTime.Parse(uriRequestData.EndDate);
            BaseCurrency = uriRequestData.BaseCurrency;
            QuotedCurrency = uriRequestData.QuotedCurrency;
        }

    }
}
