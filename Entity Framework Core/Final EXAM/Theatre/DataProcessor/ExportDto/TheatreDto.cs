namespace Theatre.DataProcessor.ExportDto
{
    public class TheatreDto
    {
        public string Name { get; set; }

        public sbyte Halls { get; set; }

        public decimal TotalIncome { get; set; }

        public TicketDto[] Tickets { get; set; }

    }
}
