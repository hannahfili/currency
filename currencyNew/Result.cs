using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class Result
    {
        public Result(string resultType, string resultInfo)
        {
            this.resultType = resultType;
            this.resultInfo = resultInfo;
        }

        public Result()
        {
        }

        public string resultInfo { get; set; }
        public string resultType { get; set; }
    }
}
