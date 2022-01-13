using currencyNew.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace currencyNew.APIKeyFilter
{
    public class APIKeyAuthentication
    {
        private MyDbContext _myDbContext;

        public APIKeyAuthentication(MyDbContext myDbContext)
        {
            _myDbContext = myDbContext;
        }
        public bool checkApiKey(Dictionary<string, string> requestHeaders)
        {
            bool apiKeyExists = requestHeaders.ContainsKey("ApiKey");
            if (apiKeyExists) return checkIfKeyExistsInDataBase(requestHeaders["ApiKey"]);
            return false;
        }
        public string generateKey()
        {
            const string src = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = 16;
            var sb = new StringBuilder();
            Random RNG = new Random();
            for (var i = 0; i < length; i++)
            {
                var c = src[RNG.Next(0, src.Length)];
                sb.Append(c);
            }
            string result = sb.ToString();

            saveKeyInDataBase(result);

            return result;

        }

        private bool checkIfKeyExistsInDataBase(string apiKey)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(apiKey));
                string hash = Convert.ToBase64String(bytes);
                try
                {
                    var result = _myDbContext.ApiKeys
                    .Where(entity =>
                    entity.Value == hash)
                    .FirstOrDefault();

                    if (result == null) return false;
                    return true;
                }
                catch (Exception)
                {
                }
                return false;
            }
                
        }
        private void saveKeyInDataBase(string key)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(key));
                string hash = Convert.ToBase64String(bytes);
                ApiKey apiKey = new ApiKey();
                apiKey.Value = hash;
                try
                {
                    _myDbContext.ApiKeys.Add(apiKey);
                    _myDbContext.SaveChanges();

                }
                catch (Exception e)
                {
                    Console.WriteLine($"save api key error: {e.Message}");
                }
            }
        }
    }
}
