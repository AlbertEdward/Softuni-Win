namespace P01_StudentSystem.Data.Models
{
    using Microsoft.EntityFrameworkCore;
    using P01_StudentSystem.Models;

    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext()
        {

        }

        public ApplicationDbContext(DbContextOptions options)
            : base (options)
        {

        }

        public virtual DbSet<Student> Students { get; set; }

        public virtual DbSet<Course> Courses { get; set; }

        public virtual DbSet<Resource> Resourses { get; set; }

        public virtual DbSet<Homework> Homeworks { get; set; }

        public virtual DbSet<StudentCourse> StudentCourses { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(Configuration.CONNECTION_STRING);
            }
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<StudentCourse>().HasKey(s => new { s.CourseId, s.StudentId });

            base.OnModelCreating(modelBuilder);
        }
    }
}
