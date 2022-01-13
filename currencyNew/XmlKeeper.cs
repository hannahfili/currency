﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using System.Xml;

namespace currencyNew
{
    public static class XmlKeeper
    {
        public static List<UriExchangeRateData> createListFromXmlString(string xml)
        {
            List<UriExchangeRateData> uriExchangeRateDatas = new List<UriExchangeRateData>();
            string date = "";
            string value = "";
            UriExchangeRateData xrd;

            if (string.IsNullOrEmpty(xml))
            {
                Console.WriteLine("xml is empty or null");
                return uriExchangeRateDatas;
            }
            

            TextReader sr = new StringReader(xml);
            XmlTextReader xtr = new XmlTextReader(sr);
            while (xtr.Read())
            {
                if (xtr.NodeType == XmlNodeType.Element && xtr.Name == "generic:ObsDimension")
                {
                    
                    date= xtr.GetAttribute("value").ToString();
                    //Console.WriteLine(xtr.GetAttribute("value").ToString());
                    
                }
                if (xtr.NodeType == XmlNodeType.Element && xtr.Name == "generic:ObsValue")
                {
                    value= xtr.GetAttribute("value").ToString();
                    xrd = new UriExchangeRateData(date, value);
                    uriExchangeRateDatas.Add(xrd);
                    //Console.WriteLine(xrd.ToString());
                }
            }
            //Console.WriteLine("---------------------");
            //Console.WriteLine("swiezo utworzona lista z xml");
            //foreach (var i in uriExchangeRateDatas) Console.WriteLine(i.ToString());
            //Console.WriteLine("---------------------");
            return uriExchangeRateDatas;

        }
    }
}
