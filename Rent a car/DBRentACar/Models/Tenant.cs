using System.ComponentModel.DataAnnotations;

namespace DBRentACar.Models
{
    public class Tenant
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        [Phone]
        public string PhoneNumber { get; set; }

        [Required]
        [EmailAddress]
        public string EmailAddress { get; set; }

        [Required]
        public string IDNumber { get; set; }

        public ICollection<Car> Cars { get; set; } = new List<Car>();
    }
}
