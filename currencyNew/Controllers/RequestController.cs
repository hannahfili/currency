using AutoMapper;
using currencyNew.APIKeyFilter;
using currencyNew.DataTransferObjects;
using currencyNew.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;


namespace currencyNew.Controllers
{
    [Route("api/request")]
    [ApiController]
    public class RequestController : ControllerBase
    {
        private MyDbContext _myDbContext;
        private IMapper _mapper;
        private IOwnDictionary _dictionary;

        public RequestController(MyDbContext myDbContext, IMapper mapper, IOwnDictionary dictionary)
        {
            _myDbContext = myDbContext;
            _mapper = mapper;
            _dictionary = dictionary;
        }

        //public IList<Request> Get()
        //{
        //    var list = DataKeeper.Get(myDbContext);

        //    //var list = this.myDbContext.Requests.ToList();

        //    foreach (Request elem in list)
        //    {
        //        Console.WriteLine($"{elem.Id} + {elem.StartDate} + {elem.EndDate} + {elem.baseCurrency} + {elem.quotedCurrency}");
        //    }


        //    return list;
        //}
        [HttpGet("{quotedCurrency}/{baseCurrency}/{startDate}/{endDate}")]
        public IActionResult Get(string quotedCurrency, string baseCurrency, string startDate, string endDate)
        {

            Dictionary<string, string> requestHeaders = new Dictionary<string, string>();
            foreach (var header in Request.Headers) requestHeaders.Add(header.Key, header.Value);
            APIKeyAuthentication apiKeyAuthentication = new APIKeyAuthentication(_myDbContext);
            string message = "ApiKey is incorrect. In order to get new ApiKey set uri to: https://localhost:5001/api/getkey";
            if (!apiKeyAuthentication.checkApiKey(requestHeaders)) return NotFound(message);


            UriRequestData uriRequestData = new UriRequestData(quotedCurrency, baseCurrency, startDate, endDate);
            Result res = new Result();
            RequestRepository repository = new RequestRepository(_myDbContext, _mapper, _dictionary.GetDictionary());


            var result = repository.Get(uriRequestData).Result;
            
            int n = 1;
            Console.WriteLine("ZAWARTOSC DICTIONARY:");
            foreach (var entry in _dictionary.GetDictionary())
            {
                Console.Write(n+" ");
                n++;
                Console.WriteLine(entry.Key.ToString());
                //foreach (var elem in entry.Value) Console.WriteLine(elem.ToString());
            }
            Console.WriteLine("@@@@@@@@@@@@@@@@@@@");

            if(result is Result)
            {
                res = (Result)result;
                if (res.resultType == "badRequest") return BadRequest(res.resultInfo);
                else if (res.resultType == "notFound") return NotFound(res.resultInfo);
                else if (res.resultType == "error") return NotFound(res.resultInfo);

            }
            if (result is List<ExchangeRate> && ((List<ExchangeRate>)result).Count>0) {
                var resultDTO = _mapper.Map<IEnumerable<ExchangeRateDTO>>(result);
                return Ok(resultDTO);
            } 
            
            return NotFound("internal server error");
            
        }

    }
}
