namespace Bank.SwiftParse
{
    using System;
    using System.Collections.Generic;
    using System.Text;

    public interface IBasicBlock
    {

        string BlockId { get; }
        string ApplicationID { get; set; }
        string ServiceId { get; set; }
        string LogicalAddres { get; set; }
        string SessionNumber { get; set; }
        string SequenceNumber { get; set; }
        List<IBasicBlock> Create(string swiftMessage);
    }
}