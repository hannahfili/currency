using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.DataTransferObjects
{
    public class RequestForCreationDTO
    {
        public RequestForCreationDTO(UriRequestData uriRequestData)
        {
            StartDate = DateTime.Parse(uriRequestData.StartDate);
            EndDate = DateTime.Parse(uriRequestData.EndDate);
            BaseCurrency = uriRequestData.BaseCurrency;
            QuotedCurrency = uriRequestData.QuotedCurrency;
            RequestDate = DateTime.Now.Date;
        }

        [Required(ErrorMessage = "StartDate is required")]
        public DateTime StartDate { get; set; }

        [Required(ErrorMessage = "EndDate is required")]
        public DateTime EndDate { get; set; }

        [Required(ErrorMessage = "RequestDate is required")]
        public DateTime RequestDate { get; set; }

        [Required(ErrorMessage = "baseCurrency symbol is required")]
        [StringLength(3, ErrorMessage = "baseCurrency symbol can't be longer than 3 characters")]
        public string BaseCurrency { get; set; }

        [Required(ErrorMessage = "quotedCurrency symbol is required")]
        [StringLength(3, ErrorMessage = "quotedCurrency symbol can't be longer than 3 characters")]
        public string QuotedCurrency { get; set; }
    }
}
