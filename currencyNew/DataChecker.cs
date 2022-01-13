using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public static class DataChecker
    {
        public static bool dateTimeIsFuture(string dateAsString)
        {
            bool future = false;
            int dateTimeComparison;
            DateTime dateTime;
            if (DateTime.TryParse(dateAsString, out dateTime))
            {
                dateTimeComparison = DateTime.Compare(dateTime, DateTime.Now);
                if (dateTimeComparison > 0) future = true;
            }
            
            return future;
        }
        public static bool checkDateTimeFormats(string date1, string date2)
        {
            DateTime dateTime1;
            DateTime dateTime2;
            bool check1 = false;
            bool check2 = false;
            if (DateTime.TryParse(date1, out dateTime1)) check1 = true;
            if (DateTime.TryParse(date2, out dateTime2)) check2 = true;
            if (check1 && check2) return true;
            else return false;

        }
              
        
        public static bool endLaterThanStart(UriRequestData uriData)
        {
            
            bool endLaterThanStart = false;
            int dateTimeComparison;

            DateTime startDateTime = DateTime.Parse(uriData.StartDate);
            DateTime endDateTime = DateTime.Parse(uriData.EndDate);
            
            dateTimeComparison = DateTime.Compare(startDateTime, endDateTime);
            if (dateTimeComparison <= 0) endLaterThanStart = true;
            
            return endLaterThanStart;
        }
        //public static async Task<bool> checkData(UriRequestData uriData)
        //{
        //    //if (dateTimeIsFuture(uriData.endDate)) uriData.endDate = DateTime.Today.ToString("yyyy-MM-dd");

        //    bool baseCurrencyIsEuro = false;
        //    bool quotedCurrencyIsEuro = false;


        //    baseCurrencyIsEuro = uriData.baseCurrency.ToUpper() == "EUR" ? true : false;
        //    quotedCurrencyIsEuro = uriData.quotedCurrency.ToUpper() == "EUR" ? true : false;

        //    if (baseCurrencyIsEuro && !quotedCurrencyIsEuro)
        //    {
        //        return await DataKeeper.GetMonoDataFromExternalAPI(uriData);
        //    }
        //    else if (!baseCurrencyIsEuro && quotedCurrencyIsEuro)
        //    {
        //        return await DataKeeper.GetMonoDataFromExternalAPI(uriData, true);

        //    }
        //    //else if (!baseCurrencyIsEuro && !quotedCurrencyIsEuro)
        //    //{
        //    //    //DataKeeper.GetDoubleDateFromExternalAPI
        //    //}

        //    return await DataKeeper.GetMonoDataFromExternalAPI(uriData);
        //}

        public static void addNewStartDateIfNoResultFoundForCurrentStartDate(List<UriExchangeRateData> uriExchangeRateDatas, UriRequestData uriRequestData, bool theOtherWayRound=false)
        {
            
            UriExchangeRateData firstElem = uriExchangeRateDatas[0];
            if(firstElem.date != uriRequestData.StartDate)
            {
                //Console.WriteLine("szukam nowej daty poczatkowej");
                //Console.WriteLine("przed dodaniem");
                //foreach (var i in uriExchangeRateDatas) Console.WriteLine(i.ToString());

                firstElem = findNewStartDate(uriRequestData, theOtherWayRound);
                uriExchangeRateDatas.Insert(0, firstElem);

                //Console.WriteLine("po dodaniu");
                //foreach (var i in uriExchangeRateDatas) Console.WriteLine(i.ToString());
                return;
            }
            if (firstElem.date == uriRequestData.StartDate && firstElem.value.ToUpper()=="NAN")
            {
                firstElem=findNewStartDate(uriRequestData, theOtherWayRound);
                Console.WriteLine("we have to change first elem");
                Console.WriteLine("first elem and start date are equal");
                uriExchangeRateDatas[0] = firstElem;
            }            
            
        }

        public static UriExchangeRateData findNewStartDate(UriRequestData uriRequestData, bool theOtherWayRound=false)
        {
            DateTime startDateTime = DateTime.Parse(uriRequestData.StartDate);
            UriExchangeRateData newStartDate = null;

            DateTime dateTimeToCheck = startDateTime.AddDays(-1);
            

            while (newStartDate==null || newStartDate.value.ToUpper() == "NAN")
            {
                
                
                string dateToCheck = dateTimeToCheck.ToString("yyyy-MM-dd");
                Console.WriteLine("data do sprawdzenia: " + dateToCheck);

                var result =ExternalAPI.GetDataFromExternalAPIWhenStartDateEqualsEndDate(dateToCheck, uriRequestData, theOtherWayRound).Result;
                if (result is UriExchangeRateData) newStartDate = (UriExchangeRateData)result;


                dateTimeToCheck=dateTimeToCheck.AddDays(-1);


            }


            return newStartDate;
            //string xml = await GetDataFromExternalAPI(address);
            //List<UriExchangeRateData> uriExchangeRateDatas = XmlKeeper.createListFromXmlString(xml);
        }

        //public static bool checkLists(List<UriExchangeRateData> list1, List<UriExchangeRateData> list2)
        //{
        //    bool areTheSame2 = list1.SequenceEqual(list2);
        //}

        }
    }
