using System.ComponentModel.DataAnnotations;
using System.Xml.Serialization;

namespace Theatre.DataProcessor.ImportDto
{
    [XmlType("Cast")]
    public class ImportCast
    {
        [XmlElement("FullName")]
        [Required]
        [MinLength(4)]
        [MaxLength(30)]
        public string FullName { get; set; }

        [XmlElement("IsMainCharacter")]
        [Required]
        public bool IsMainCharacter { get; set; }

        [XmlElement("PhoneNumber")]
        [RegularExpression(@"^\+\d{2}\-\d{2}\-\d{3}\-\d{4}$")]
        [Required]
        public string PhoneNumber { get; set; }
    }
}