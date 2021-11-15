using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace P01_StudentSystem.Models
{
    public class Resource
    {
        public int ResourseId { get; set; }

        [MaxLength(50)]
        public string Name { get; set; }

        public int MyProperty { get; set; }

        public string Url { get; set; }

        public Enum ResourceType { get; set; }

        public Course CourseId { get; set; }

    }
}
