using DBRentACar.Models;
using Microsoft.EntityFrameworkCore;

namespace DBRentACar
{
    public class RentACarDBContext : DbContext
    {
        public RentACarDBContext()
        {

        }
        public RentACarDBContext(DbContextOptions options)
            : base(options)
        {
            
        }

        public DbSet<Car> Cars { get; set; }
        public DbSet<Tenant> Tenants {get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"Server=.;Database=RentACar;Integrated Security=True;");
            }
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Car>().Property(e => e.RentPrice).HasPrecision(18, 2);
        }
    }
}
