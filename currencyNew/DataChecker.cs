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
        
        public static void addNewStartDateIfNoResultFoundForCurrentStartDate(List<UriExchangeRateData> uriExchangeRateDatas, UriRequestData uriRequestData, bool theOtherWayRound=false)
        {
            
            UriExchangeRateData firstElem = uriExchangeRateDatas[0];
            if(firstElem.date != uriRequestData.StartDate)
            {
                
                firstElem = findNewStartDate(uriRequestData, theOtherWayRound);
                uriExchangeRateDatas.Insert(0, firstElem);

                return;
            }
            if (firstElem.date == uriRequestData.StartDate && firstElem.value.ToUpper()=="NAN")
            {
                firstElem=findNewStartDate(uriRequestData, theOtherWayRound);
                
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

                var result =ExternalAPI.GetDataFromExternalAPIWhenStartDateEqualsEndDate(dateToCheck, uriRequestData, theOtherWayRound).Result;
                if (result is UriExchangeRateData) newStartDate = (UriExchangeRateData)result;


                dateTimeToCheck=dateTimeToCheck.AddDays(-1);


            }


            return newStartDate;
        }

        

        }
    }
