using System;
using P03_FootballBetting;
using P03_FootballBetting.Data;

namespace P03_FootballBetting
{
    class StartUp
    {
        static void Main(string[] args)
        {
            FootballBettingContext dbContext = new FootballBettingContext();
            dbContext.Database.EnsureDeleted();
            dbContext.Database.EnsureCreated();

            Console.WriteLine("DATABASE created successfully");

           // dbContext.Database.EnsureDeleted();

        }
    }
}
