namespace Theatre.DataProcessor.ExportDto
{
    using System.Collections.Generic;
    using System.Xml.Serialization;

    [XmlType("Play")]
    public class PlayDto
    {
        [XmlAttribute]
        public string Title { get; set; }

        [XmlAttribute]
        public string Duration { get; set; }

        [XmlAttribute]
        public string Rating { get; set; }

        [XmlAttribute]
        public string Genre { get; set; }

        [XmlArray("Actors")]
        public List<ActorDto> Actors { get; set; }
    }
}
