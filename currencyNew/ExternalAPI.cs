using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net.Http;

namespace currencyNew
{
    public static class ExternalAPI
    {
        public static async Task<Object> GetDataFromExternalAPIWhenStartDateEqualsEndDate(string dateAsString, UriRequestData uriRequestData, bool theOtherWayRound=false)
        {
            string baseAddress = "https://sdw-wsrest.ecb.europa.eu/service/data/EXR/D.";
            string quotedCurrency = uriRequestData.QuotedCurrency;
            string baseCurrency = uriRequestData.BaseCurrency;

            if (theOtherWayRound)
            {
                baseCurrency = uriRequestData.QuotedCurrency;
                quotedCurrency = uriRequestData.BaseCurrency;
            }
            string address = string.Concat(baseAddress, quotedCurrency, ".", baseCurrency, ".SP00.A?startPeriod=", dateAsString, "&endPeriod=", dateAsString);

            

            var xml = await GetDataFromExternalAPI(address);
            if (xml is Result) return xml;

            string xmlString = (string)xml;

            List<UriExchangeRateData> uriExchangeRateDatas = XmlKeeper.createListFromXmlString(xmlString);

            if (uriExchangeRateDatas.Count() == 1) return uriExchangeRateDatas.First();
            else return new Result("emptyList", "data not found for single dateTime");

        }
        public static async Task<Object> GetDataFromExternalAPI(string address)
        {
            string xml = "";
            using (var client = new HttpClient())
            {
                try
                {
                    xml = await client.GetStringAsync(address);
                    return xml;
                }

                catch (Exception)
                {
                    return new Result("error", "external api error");
                }


            }

        }
    }
}
