using EntityRelations_LAB.Models;
using System;

namespace EntityRelations_LAB
{
    public class StartUp
    {
        static void Main(string[] args)
        {
            var db = new ApplicationDBContext();
            db.Database.EnsureDeleted();
            db.Database.EnsureCreated();

            for (int i = 0; i < 10; i++)
            {
                db.Employees.Add(new Employee
                {
                    FirstName = "Albert" + i,
                    Lastname = "Khurshudyan" + i,
                    StartWorkDate = DateTime.Now,
                    Salary = 2000 + i,
                });
            }

            db.SaveChanges();

        }
    }
}
