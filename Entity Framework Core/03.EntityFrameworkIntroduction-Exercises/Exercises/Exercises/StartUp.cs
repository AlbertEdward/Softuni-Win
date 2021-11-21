﻿namespace SoftUni
{
    using Microsoft.EntityFrameworkCore;
    using SoftUni.Data;
    using SoftUni.Models;
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Text;

    public class StartUp
    {
        static void Main(string[] args)
        {
            SoftUniContext sk = new SoftUniContext();
            string context = GetAddressesByTown(sk);
            Console.WriteLine(context);

        }


        //Problem 3
        public static string GetEmployeesFullInformation(SoftUniContext context)
        {
            StringBuilder sb = new StringBuilder();

            Employee[] employees = context
                .Employees
                .OrderBy(e => e.EmployeeId)
                .ToArray();

            foreach (Employee e in employees)
            {
                sb.AppendLine($"{e.FirstName} {e.LastName} {e.MiddleName} {e.JobTitle} {e.Salary:F2}");
            }

            return sb.ToString().TrimEnd();
        }

        //Problem 4
        public static string GetEmployeesWithSalaryOver50000(SoftUniContext context)
        {
            Employee[] employees = context
                .Employees
                .Where(e => e.Salary > 50000)
                .OrderBy(e => e.FirstName)
                .ToArray();

            StringBuilder sb = new StringBuilder();

            foreach (Employee e in employees)
            {
                sb.AppendLine($"{e.FirstName} - {e.Salary:F2}");
            }

            return sb.ToString();


        }

        //Problem 5
        public static string GetEmployeesFromResearchAndDevelopment(SoftUniContext context)
        {
            StringBuilder sb = new StringBuilder();

            var employees = context
                .Employees
                .Where(e => e.Department.Name == "Research and Development")
                .OrderBy(x => x.Salary)
                .ThenByDescending(x => x.FirstName)
                .Select(x => new
                {
                    x.FirstName,
                    x.LastName,
                    DepartmentName = x.Department.Name,
                    x.Salary
                })
                .ToArray();

            foreach (var e in employees)
            {
                sb.AppendLine($"{e.FirstName} {e.LastName} from Research and Development - ${e.Salary:F2}");
            }

            return sb.ToString();
        }

        //Problem 6
        public static string AddNewAddressToEmployee(SoftUniContext context)
        {
            StringBuilder sb = new StringBuilder();

            Address newAddress = new Address()
            {
                AddressText = "Vitoshka 15",
                TownId = 4
            };

            context.Addresses.Add(newAddress);

            Employee nakovEmployees = context
                .Employees
                .First(e => e.LastName == "Nakov");

            nakovEmployees.Address = newAddress;

            context.SaveChanges();

            string[] allEmployeesAddresses = context
                .Employees
                .OrderByDescending(x => x.AddressId)
                .Select(e => e.Address.AddressText)
                .Take(10)
                .ToArray();

            return string.Join(Environment.NewLine, allEmployeesAddresses);
        }

        //Problem 7
        public static string GetEmployeesInPeriod(SoftUniContext context)
        {
            StringBuilder content = new StringBuilder();

            var employees = context.Employees
                .Include(x => x.Manager)
                .Include(x => x.EmployeesProjects)
                .ThenInclude(x => x.Project)
                .Where(employee => employee.EmployeesProjects
                    .Any(project => project.Project.StartDate.Year >= 2001
                                    && project.Project.StartDate.Year <= 2003))
                .Take(10)
                .ToList();

            foreach (var employee in employees)
            {
                content.AppendLine($"{employee.FirstName} {employee.LastName} - Manager: {employee.Manager.FirstName} {employee.Manager.LastName}");

                foreach (var project in employee.EmployeesProjects)
                {
                    content.AppendLine($"--{project.Project.Name} -" +
                                       $" {project.Project.StartDate.ToString("M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)} - " +
                                       $"{(project.Project.EndDate == null ? "not finished" : project.Project.EndDate.Value.ToString("M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture))}");
                }
            }

            return content.ToString().TrimEnd();


        }

        //Problem 8 - UNSOLVED
        public static string GetAddressesByTown(SoftUniContext context)
        {
            var address = context.Addresses
                    .GroupBy(a => new
                    {
                        a.AddressId,
                        a.AddressText,
                        a.Town.Name
                    },
                        (key, group) => new
                        {
                            AddressText = key.AddressText,
                            Town = key.Name,
                            Count = group.Sum(a => a.Employees.Count)
                        })
                    .OrderByDescending(o => o.Count)
                    .ThenBy(o => o.Town)
                    .ThenBy(o => o.AddressText)
                    .Take(10)
                    .ToList();

            StringBuilder sb = new StringBuilder();

            foreach (var a in address)
            {
                sb.AppendLine($"{a.AddressText}, {a.Town} - {a.Count} employees");
            }

            return sb.ToString();
        
        }

        //Problem 9

        public static string GetEmployee147(SoftUniContext context)
        {
            using (var dbContext = new SoftUniContext())
            {
                var employee = dbContext.Employees.
                    Where(e => e.EmployeeId == 147)
                    .Select(e => new {
                        e.FirstName,
                        e.LastName,
                        e.JobTitle,
                        Projects = e.EmployeesProjects
                            .Select(ep => ep.Project.Name)
                            .OrderBy(p => p)
                            .ToList()
                    })
                    .First();

                StringBuilder sb = new StringBuilder();

                sb.AppendLine($"{employee.FirstName} {employee.LastName} - {employee.JobTitle}{Environment.NewLine}{String.Join(Environment.NewLine, employee.Projects)}");

                return sb.ToString();
            }
        }

        //Problem 11
        public static string GetLatestProjects(SoftUniContext context)
        {
            var projects = context
                .Projects
                .Select(p => new
                {
                    p.Name,
                    p.Description,
                    p.StartDate
                })
                .OrderByDescending(p => p.StartDate)
                .Take(10)
                .ToArray();

            var a = projects.OrderBy(p => p.Name);

            StringBuilder sb = new StringBuilder();

            foreach (var p in a)
            {
                sb.AppendLine(p.Name);
                sb.AppendLine(p.Description);
                sb.AppendLine($"{p.StartDate.ToString("M/d/yyyy h:mm:ss tt", new CultureInfo("en-US"))}");
            }

            return sb.ToString();
        }

        //Problem 12
        public static string IncreaseSalaries(SoftUniContext context)
        { 
            StringBuilder sb = new StringBuilder();

            Employee[] increasedEmployees = context
                .Employees
                .Where(e => e.Department.Name == "Engineering" ||
                e.Department.Name == "Tool Design" ||
                e.Department.Name == "Marketing" ||
                e.Department.Name == "Information Services")
                .OrderBy(e => e.FirstName)
                .ThenBy(e => e.LastName)
                .ToArray();

            foreach (var e in increasedEmployees)
            {
                e.Salary = e.Salary * 0.12m + e.Salary;
                sb.AppendLine($"{e.FirstName} {e.LastName} (${e.Salary:F2})");
            }

            return sb.ToString();
        }





    }
    
}
