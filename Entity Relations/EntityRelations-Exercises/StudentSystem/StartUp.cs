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

            for (int i = 0; i < 10; i++)
            {
                db.Students.Add(new Student
                {
                    Name = "Albert" + i,
                    PhoneNumber = 089623453 + i,
                    RegisteredOn = DateTime.Now,
                    BirthDate = DateTime.Now,
                });
            }

            db.SaveChanges();
        }
    }
}
