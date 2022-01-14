using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public static class Calculator
    {
        public static Object countTheOtherWayRound(List<UriExchangeRateData> uriExchangeRateDatas)
        {
            decimal decimalValue = 0;
            foreach(var elem in uriExchangeRateDatas){

                
                try
                {
                    decimalValue = Convert.ToDecimal(elem.value, new CultureInfo("en-US"));
                    decimalValue = Math.Round(1 / decimalValue, 4);
                    elem.value = decimalValue.ToString(new CultureInfo("en-US"));
                }
                catch (Exception e)
                {
                    return new Result("error", e.Message);
                }

            }
            return null;
            
        }
        public static Object countNewCurrencyRate(List<UriExchangeRateData> euroVsBase, List<UriExchangeRateData> euroVsQuoted)
        {
            List<UriExchangeRateData> newCurrency = new List<UriExchangeRateData>();

            decimal euroVsBaseDecimal = 0;
            decimal euroVsQuotedDecimal = 0;
            decimal desiredExchangeRate = 0;

            for(int i=0; i<euroVsBase.Count(); i++)
            {
                try
                {
                    euroVsBaseDecimal = Convert.ToDecimal(euroVsBase[i].value, new CultureInfo("en-US"));
                    euroVsQuotedDecimal = Convert.ToDecimal(euroVsQuoted[i].value, new CultureInfo("en-US"));
                    desiredExchangeRate = Math.Round(euroVsQuotedDecimal/euroVsBaseDecimal, 4);

                    newCurrency.Add(new UriExchangeRateData(euroVsBase[i].date, desiredExchangeRate.ToString(new CultureInfo("en-US"))));
                }
                catch (Exception e)
                {
                    return new Result("error", e.Message);
                }
            }

            return newCurrency;
        }
    }
}
