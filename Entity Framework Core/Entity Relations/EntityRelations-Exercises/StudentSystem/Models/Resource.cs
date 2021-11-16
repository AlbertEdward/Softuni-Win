using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace P01_StudentSystem.Models
{
    public class Resource
    {
        [Key]
        public int ResourseId { get; set; }

        public string Name { get; set; }

        public int MyProperty { get; set; }

        public string Url { get; set; }

        public Enum Resources { get; set; }

        public int CourseId { get; set; }

    }
}
