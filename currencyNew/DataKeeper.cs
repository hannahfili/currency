using currencyNew.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Xml;
using System.IO;

namespace currencyNew
{
    public class DataKeeper
    {
        public static async Task<Object> GetMonoDataFromExternalAPI(UriRequestData uriRequestData, bool theOtherWayRound = false)
        {
            string baseAddress = "https://sdw-wsrest.ecb.europa.eu/service/data/EXR/D.";
            string quotedCurrency = uriRequestData.QuotedCurrency;
            string baseCurrency = uriRequestData.BaseCurrency;

            if (theOtherWayRound)
            {
                baseCurrency = uriRequestData.QuotedCurrency;
                quotedCurrency = uriRequestData.BaseCurrency;
            }


            string address = string.Concat(baseAddress, quotedCurrency, ".", baseCurrency, ".SP00.A?startPeriod=", uriRequestData.StartDate, "&endPeriod=", uriRequestData.EndDate);

      
            var xml = await ExternalAPI.GetDataFromExternalAPI(address);
            if (xml is Result) return xml;

            string xmlString = (string)xml;

            List<UriExchangeRateData> uriExchangeRateDatas = XmlKeeper.createListFromXmlString(xmlString);
            if (uriExchangeRateDatas.Count() == 0)
            {
                UriExchangeRateData firstElem = DataChecker.findNewStartDate(uriRequestData, theOtherWayRound);
                uriExchangeRateDatas.Add(firstElem);
            }
            else
            {
                DataChecker.addNewStartDateIfNoResultFoundForCurrentStartDate(uriExchangeRateDatas, uriRequestData, theOtherWayRound);
            }
            uriExchangeRateDatas.RemoveAll(uxrd => uxrd.value.ToUpper() == "NAN");
            if (theOtherWayRound) Calculator.countTheOtherWayRound(uriExchangeRateDatas);
            
            

            return uriExchangeRateDatas;
        }
        public static async Task<Object> GetDoubleDataFromExternalAPI(UriRequestData originalUriRequestData)
        {
            string euroCode = "EUR";
            UriRequestData euroVsBaseCurrency = new UriRequestData(originalUriRequestData.BaseCurrency, euroCode, originalUriRequestData.StartDate, originalUriRequestData.EndDate);
            UriRequestData euroVsQuotedCurrency = new UriRequestData(originalUriRequestData.QuotedCurrency, euroCode, originalUriRequestData.StartDate, originalUriRequestData.EndDate);

            var euroVsBaseCurrencyResult = await GetMonoDataFromExternalAPI(euroVsBaseCurrency);
            var euroVsQuotedCurrencyResult = await GetMonoDataFromExternalAPI(euroVsQuotedCurrency);

            if (euroVsBaseCurrencyResult is Result) return euroVsBaseCurrencyResult;
            if (euroVsQuotedCurrencyResult is Result) return euroVsQuotedCurrencyResult;

            List<UriExchangeRateData> euroVsBaseCurrencyResultList = (List<UriExchangeRateData>)euroVsBaseCurrencyResult;
            List<UriExchangeRateData> euroVsQuotedCurrencyResultList = (List<UriExchangeRateData>)euroVsQuotedCurrencyResult;

            
            if (euroVsBaseCurrencyResultList.SequenceEqual(euroVsQuotedCurrencyResultList))
            {
                
                return Calculator.countNewCurrencyRate(euroVsBaseCurrencyResultList, euroVsQuotedCurrencyResultList);
            }
            
            return new Result("notFound", "cannot convert exchange rates");
        }



    }
}
