using System;
using System.Collections.Generic;
using System.Text;

namespace EntityRelations_LAB
{
    public class Employee
    {
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string Lastname { get; set; }

        public DateTime? StartWorkDate { get; set; }

        public decimal Salary { get; set; }

    }
}
