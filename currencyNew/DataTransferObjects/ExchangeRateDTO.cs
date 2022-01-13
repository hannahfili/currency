using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.DataTransferObjects
{
    public class ExchangeRateDTO
    {
        [Column("ExchangeRateId")]
        public Guid Id { get; set; }


        [Required(ErrorMessage = "Date is required")]
        public DateTime Date { get; set; }

        [Required(ErrorMessage = "Value is required")]
        public decimal Value { get; set; }

    }
}
