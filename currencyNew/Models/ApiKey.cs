using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.Models
{
    [Table("apikey")]
    public class ApiKey
    {
        [Column("Id")]
        public int Id { get; set; }


        [Required(ErrorMessage = "apiKey value is required")]
        [StringLength(256, ErrorMessage = "apiKey value length can't be longer than 256 characters")]
        public string Value { get; set; }
    }
}
