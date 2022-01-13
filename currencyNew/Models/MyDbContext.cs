using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace currencyNew.Models
{
    public class MyDbContext:DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {
        }
        public DbSet<Request> Requests { get; set; }

        public DbSet<ExchangeRate> ExchangeRates { get; set; }

        public DbSet<ApiKey> ApiKeys { get; set; }

    }
}
