using P01_StudentSystem.Data.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace P01_StudentSystem.Models
{
    public class StudentCourse
    {
        [Key]
        public int StudentId { get; set; }

        public Student Student { get; set; }

        public int CourseId{ get; set; }

        public Course Course { get; set; }
    }
}
