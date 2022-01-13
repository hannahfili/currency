using currencyNew.DataTransferObjects;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.Models
{
    [Table("request")]
    public class Request
    {
        [Column("RequestId")]
        public Guid Id { get; set; }


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



        public ICollection<ExchangeRate> ExchangeRates { get; set; }

        

        public override string ToString()
        {
            return "id: " + Id + "\nstartDate: " + StartDate.ToString() + "endDate: " + EndDate.ToString() + "\nbaseCur: " + BaseCurrency + "quotCur: " + QuotedCurrency + "\nreqDate: " + RequestDate;
        }

    }
}
