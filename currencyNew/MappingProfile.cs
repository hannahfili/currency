using AutoMapper;
using currencyNew.DataTransferObjects;
using currencyNew.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<ExchangeRate, ExchangeRateDTO>();
            CreateMap<Request, RequestDTO>();
            CreateMap<RequestForCreationDTO, Request>();
        }
    }
}
