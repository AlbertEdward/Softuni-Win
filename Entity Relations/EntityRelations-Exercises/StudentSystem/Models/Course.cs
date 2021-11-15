using P01_StudentSystem.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace P01_StudentSystem
{
    public class Course
    {
        public int CourseId { get; set; }

        public string Name { get; set; }

        public string? Description { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public decimal Price { get; set; }

        public ICollection<StudentCourse> Courses { get; set; }
    }
}
