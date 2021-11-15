using P01_StudentSystem.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace P01_StudentSystem.Data.Models
{
    public class Student
    {
        public int StudentId { get; set; }

        [MaxLength(100)]
        [Required]
        public string Name { get; set; }

        
        public int PhoneNumber { get; set; }

        [Required]
        public DateTime RegisteredOn { get; set; }

        public DateTime BirthDate { get; set; }

        public ICollection<StudentCourse> Students { get; set; }

        public ICollection<Homework> Homeworks { get; set; }

    }
}
