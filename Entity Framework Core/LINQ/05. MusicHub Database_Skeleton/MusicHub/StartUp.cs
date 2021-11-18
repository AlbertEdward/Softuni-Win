namespace MusicHub
{
    using System;
    using System.Collections.Generic;
    using Data;
    using System.Linq;
    using Initializer;
    using MusicHub.Data.Models;
    using System.Text;
    using System.Globalization;

    public class StartUp
    {
        public static void Main(string[] args)
        {
            MusicHubDbContext context = 
                new MusicHubDbContext();

            DbInitializer.ResetDatabase(context);

            string result = ExportAlbumsInfo(context, 9);
            Console.WriteLine(result);
        }

        public static string ExportAlbumsInfo(MusicHubDbContext context, int producerId)
        {
            StringBuilder sb = new StringBuilder();

            var albumsInfo = context
                .Albums
                .ToArray()
                .Where(x => x.ProducerId == producerId)
                .OrderByDescending(x => x.Price)
                .Select(x => new
                {
                    AlbumName = x.Name,
                    ReleaseDate = x.ReleaseDate.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture),
                    ProducerName = x.Producer.Name,
                    Songs = x.Songs
                    .ToArray()
                    .Select(s => new
                    {
                        SongName = s.Name,
                        Price = s.Price.ToString("f2"),
                        Writer = s.Writer.Name
                    })
                        .OrderByDescending(x => x.SongName)
                        .ThenBy(x => x.Writer)
                        .ToArray(),
                    TotalAlbumPrice = x.Price.ToString("f2"),
                })
                .ToArray();


            foreach (var a in albumsInfo)
            {
                sb.AppendLine($"-AlbumName: {a.AlbumName}");
                sb.AppendLine($"-ReleaseDate: {a.ReleaseDate}");
                sb.AppendLine($"-ProducerName: {a.ProducerName}");
                sb.AppendLine($"-Songs:");

                int i = 1;
                foreach (var s in a.Songs)
                {
                    sb.AppendLine($"---#{i++}");
                    sb.AppendLine($"---SongName: {s.SongName}");
                    sb.AppendLine($"---Price: {s.Price}");
                    sb.AppendLine($"---Writer: {s.Writer}");
                }

                sb.AppendLine($"-AlbumPrice: {a.TotalAlbumPrice}");
            }

            return sb.ToString().TrimEnd();

        }

        public static string ExportSongsAboveDuration(MusicHubDbContext context, int duration)
        {
            throw new NotImplementedException();
        }
    }
}
