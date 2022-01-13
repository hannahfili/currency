using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public static class Helper
    {
        public static List<ExchangeRate> convertUriDataToExchangeRateDTOs(List<UriExchangeRateData> uriExchangeRateDatas)
        {
            List<ExchangeRate> convertedData = new List<ExchangeRate>();
            foreach (var elem in uriExchangeRateDatas)
            {
                ExchangeRate exr = new ExchangeRate();
                DateTime date = new DateTime();

                exr.Value = Convert.ToDecimal(elem.value, new CultureInfo("en-US"));
                exr.Id = new Guid();
                if (DateTime.TryParse(elem.date, out date))
                {
                    exr.Date = date;
                    convertedData.Add(exr);
                }

            }
            return convertedData;
        }
    }
}
