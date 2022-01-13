
using currencyNew.APIKeyFilter;
using currencyNew.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.Controllers
{
    [Route("api/getkey")]
    [ApiController]
    public class ApiKeyController : ControllerBase
    {
        private MyDbContext _myDbContext;

        public ApiKeyController(MyDbContext myDbContext)
        {
            _myDbContext = myDbContext;
        }

        [HttpGet]
        public IActionResult GetApiKey()
        {
            APIKeyAuthentication aka = new APIKeyAuthentication(_myDbContext);
            return Ok(aka.generateKey());
        }
    }
}
