using P01_StudentSystem.Data.Models;
using System;

namespace P01_StudentSystem
{
    public class StartUp
    {
        static void Main(string[] args)
        {
            var db = new ApplicationDbContext();
            db.Database.EnsureDeleted();
            db.Database.EnsureCreated();

        }
    }
}
