using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.DataTransferObjects
{
    public class RequestDTO
    {
        public RequestDTO()
        {
        }
       

        public RequestDTO(DateTime startDate, DateTime endDate, DateTime requestDate, string baseCurrency, string quotedCurrency)
        {
            StartDate = startDate;
            EndDate = endDate;
            RequestDate = requestDate;
            BaseCurrency = baseCurrency;
            QuotedCurrency = quotedCurrency;
        }
        public RequestDTO(UriRequestData uriRequestData)
        {
            StartDate = DateTime.Parse(uriRequestData.StartDate);
            EndDate = DateTime.Parse(uriRequestData.EndDate);
            BaseCurrency = uriRequestData.BaseCurrency;
            QuotedCurrency = uriRequestData.QuotedCurrency;
        }


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

        //public bool EqualsRequestHelper(RequestHelper obj)
        //{
        //    return StartDate == obj.StartDate &&
        //           EndDate == obj.EndDate &&
        //           BaseCurrency == obj.BaseCurrency &&
        //           QuotedCurrency == obj.QuotedCurrency;
        //}
        public object Clone()
        {
            return this.MemberwiseClone();
        }

        public override bool Equals(object obj)
        {
            return obj is RequestDTO dTO &&
                   StartDate == dTO.StartDate &&
                   EndDate == dTO.EndDate &&
                   BaseCurrency == dTO.BaseCurrency &&
                   QuotedCurrency == dTO.QuotedCurrency;
        }

        public override string ToString()
        {
            return $"id: {Id} requestDate: {RequestDate} startDate: {StartDate} endDate: {EndDate} baseCur: {BaseCurrency} quotedCur: {QuotedCurrency}";
            //return $"id: {Id} requestDate: {RequestDate}";// startDate: {StartDate} endDate: {EndDate} baseCur: {BaseCurrency} quotedCur: {QuotedCurrency}";
        }
    }
}
