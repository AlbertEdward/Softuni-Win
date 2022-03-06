using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Database.Models
{
    public class Car
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Make { get; set; }

        [Required]
        public string Model { get; set; }

        [Required]
        public decimal RentPrice { get; set; }

        [Required]
        public DateTime StartingDate { get; set; }

        [Required]
        public DateTime EndingDate { get; set; }

        public int HorsePower { get; set; }

        public int NumberOfSeats { get; set; }

        [ForeignKey(nameof(Tenant))]
        public int TenantId { get; set; }
        public Tenant Tenant { get; set; }

    }
}
