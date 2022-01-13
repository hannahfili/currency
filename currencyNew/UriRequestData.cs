using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class UriRequestData
    {
        public UriRequestData(string quotedCurrency, string baseCurrency, string startDate, string endDate)
        {
            this.StartDate = startDate;
            this.EndDate = endDate;
            this.BaseCurrency = baseCurrency;
            this.QuotedCurrency = quotedCurrency;
        }

        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string BaseCurrency { get; set; }
        public string QuotedCurrency { get; set; }
        public string additionalStartDate { get; set; }
    }
}
