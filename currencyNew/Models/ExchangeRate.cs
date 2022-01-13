using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.Models
{
    [Table("exchangerate")]
    public class ExchangeRate
    {

        [Column("ExchangeRateId")]
        public Guid Id { get; set; }


        [Required(ErrorMessage = "Date is required")]
        public DateTime Date { get; set; }

        [Required(ErrorMessage = "Value is required")]
        public decimal Value { get; set; }



        [ForeignKey(nameof(Request))]
        public Guid RequestId { get; set; }
        public Request Request { get; set; }

        public override string ToString()
        {
            return $"id: {Id}, Date: {Date.ToString("yyyy-MM-dd")}, Value: {Value.ToString(new CultureInfo("en-US"))}";
        }
    }
}
