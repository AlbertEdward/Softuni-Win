namespace Theatre.DataProcessor.ExportDto
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Xml.Serialization;

    [XmlType("Actor")]
    public class ActorDto
    {
        [XmlAttribute]
        public string FullName { get; set; }

        [XmlAttribute]
        public string MainCharacter { get; set; }
    }
}
