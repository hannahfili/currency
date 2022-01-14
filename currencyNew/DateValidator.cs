using currencyNew.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class DateValidator : IDateValidator
    {
        private DateTime _lastUpdateTime;

        public DateValidator()
        {
            _lastUpdateTime = new DateTime(2022, 1, 1);
        }

        public DateTime GetLastUpdate()
        {
            return _lastUpdateTime;
        }
        public void ChangeLastUpdateTime()
        {
            DateTime today = DateTime.Now;
            if (today.Subtract(_lastUpdateTime).TotalDays >= 7)
            {
                _lastUpdateTime = today;
            }
        }


    }
}
