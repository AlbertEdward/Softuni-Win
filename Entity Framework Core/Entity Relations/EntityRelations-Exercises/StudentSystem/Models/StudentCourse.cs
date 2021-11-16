using P01_StudentSystem.Data.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace P01_StudentSystem.Models
{
    public class StudentCourse
    {
        //TODO DOUBLE PK

        [ForeignKey(nameof(Student))]
        public int StudentId { get; set; }
        public Student Student { get; set; }

        [ForeignKey(nameof(Course))]
        public int CourseId{ get; set; }
        public Course Course { get; set; }
    }
}
