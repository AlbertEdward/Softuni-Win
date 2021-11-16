using P01_StudentSystem.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace P01_StudentSystem.Data.Models
{
    public class Student
    {
        public Student()
        {
            CourseEnrollments = new HashSet<StudentCourse>();
            HomeworkSubmissions = new HashSet<Homework>();
        }

        [Key]
        public int StudentId { get; set; }

        public string Name { get; set; }
        
        public int PhoneNumber { get; set; }

        public DateTime RegisteredOn { get; set; }

        public DateTime BirthDate { get; set; }

        public virtual ICollection<StudentCourse> CourseEnrollments { get; set; }

        public virtual ICollection<Homework> HomeworkSubmissions { get; set; }
    }
}
