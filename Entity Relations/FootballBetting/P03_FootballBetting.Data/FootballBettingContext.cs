using Microsoft.EntityFrameworkCore;
using System;

namespace P03_FootballBetting.Data
{
    public class FootballBettingContext : DbContext
    {
        //For testing db (local)
        public FootballBettingContext()
        {

        }

        //For Judge testing
        public FootballBettingContext(DbContextOptions options)
            : base(options)
        {

        }

        //To configure connection to your server
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(Configuration.CONNECTION_STRING);
            }
        }

        //To configure DB relations (DDL)
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}
