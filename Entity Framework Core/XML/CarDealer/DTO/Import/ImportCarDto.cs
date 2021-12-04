namespace CarDealer.DTO.Import
{
    using CarDealer.Models;
    using System.Collections.Generic;
    using System.Xml.Serialization;

    [XmlType("Car")]
    public class ImportCarDto
    {
        [XmlElement("make")]
        public string Make { get; set; }

        [XmlElement("model")]
        public string Model { get; set; }

        [XmlElement("TraveledDistance")]
        public long TraveledDistance { get; set; }

        [XmlElement("parts")]
        public ICollection<Part> Parts { get; set; }
    }
}
