using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class UriExchangeRateData
    {
        public UriExchangeRateData(string date, string value)
        {
            this.date = date;
            this.value = value;
        }

        public string date { get; set; }
        public string value { get; set; }

        public override bool Equals(object obj)
        {
            return obj is UriExchangeRateData data &&
                   date.Equals(data.date);
        }

        public override string ToString()
        {
            return "date: " + this.date + "\tvalue:" + this.value;
        }

    }
}
