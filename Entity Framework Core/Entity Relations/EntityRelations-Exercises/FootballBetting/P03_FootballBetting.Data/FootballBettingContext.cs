namespace P03_FootballBetting.Data
{
    using Microsoft.EntityFrameworkCore;
    using P03_FootballBetting.Data.Models;
    using System.Diagnostics.CodeAnalysis;

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
        public virtual DbSet<Team> Teams { get; set; }

        public virtual DbSet<Color> Colors { get; set; }

        public virtual DbSet<Town> Towns { get; set; }

        public virtual DbSet<Country> Countries { get; set; }

        public virtual DbSet<Player> Players { get; set; }

        public virtual DbSet<Position> Positions { get; set; }

        public virtual DbSet<PlayerStatistic> PlayerStatistics { get; set; }

        public virtual DbSet<Game> Games { get; set; }

        public virtual DbSet<Bet> Bets { get; set; }

        public virtual DbSet<User> Users { get; set; }
 

        //To configure connection to your server
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(Configuration.CONNECTION_STRING);
            }

            base.OnConfiguring(optionsBuilder);
        }

        //To configure DB relations (DDL)
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PlayerStatistic>().HasKey(x => new { x.GameId, x.PlayerId });

            modelBuilder.Entity<Team>()
                .HasOne(t => t.PrimaryKitColor)
                .WithMany(t => t.PrimaryKitTeams)
                .HasForeignKey(t => t.PrimaryKitColorId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Team>()
                .HasOne(t => t.SecondaryKitColor)
                .WithMany(t => t.SecondaryKitTeams)
                .HasForeignKey(t => t.SecondaryKitColorId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Game>()
                .HasOne(g => g.HomeTeam)
                .WithMany(g => g.HomeGames)
                .HasForeignKey(g => g.HomeTeamId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Game>()
                .HasOne(g => g.AwayTeam)
                .WithMany(g => g.AwayGames)
                .HasForeignKey(g => g.AwayTeamId)
                .OnDelete(DeleteBehavior.Restrict);

            base.OnModelCreating(modelBuilder);
        }
    }
}
