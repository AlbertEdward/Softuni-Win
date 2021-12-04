namespace Theatre.DataProcessor
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.Linq;
    using System.Text;
    using Theatre.Data;
    using Theatre.Data.Models;
    using Theatre.Data.Models.Enum;
    using Theatre.DataProcessor.ImportDto;

    public class Deserializer
    {
        private const string ErrorMessage = "Invalid data!";

        private const string SuccessfulImportPlay
            = "Successfully imported {0} with genre {1} and a rating of {2}!";

        private const string SuccessfulImportActor
            = "Successfully imported actor {0} as a {1} character!";

        private const string SuccessfulImportTheatre
            = "Successfully imported theatre {0} with #{1} tickets!";

        public static string ImportPlays(TheatreContext context, string xmlString)
        {
            StringBuilder sb = new StringBuilder();
            ImportPlay[] playDtosInput = ConverterXml.Deserializer<ImportPlay>(xmlString, "Plays");
            HashSet<Play> validPlaysModels = new HashSet<Play>();

            foreach (var platDtoModels in playDtosInput.Distinct())
            {
                TimeSpan durationTime;
                if (!IsValid(platDtoModels))
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }
                bool durationIsValid = TimeSpan.TryParseExact(platDtoModels.Duration, "c", CultureInfo.InvariantCulture, out durationTime);
                if (durationTime.Hours < 1 || !durationIsValid)
                {
                    sb.AppendLine(ErrorMessage);
                    continue;
                }
                Play play = new Play
                {
                    Title = platDtoModels.Title,
                    Duration = durationTime,
                    Rating = platDtoModels.Rating,
                    Genre = Enum.Parse<Genre>(platDtoModels.Genre),
                    Description = platDtoModels.Description,
                    Screenwriter = platDtoModels.Screenwriter
                };

                validPlaysModels.Add(play);
                sb.AppendLine(String.Format(SuccessfulImportPlay, platDtoModels.Title, platDtoModels.Genre, play.Rating));
            }

            context.Plays.AddRange(validPlaysModels);
            context.SaveChanges();

            return sb.ToString().TrimEnd();
        }

        public static string ImportCasts(TheatreContext context, string xmlString)
        {
            ImportCast[] castDtoInput = ConverterXml.Deserializer<ImportCast>(xmlString, "Casts");

            StringBuilder sb = new StringBuilder();

            HashSet<Cast> validCast = new HashSet<Cast>();

            foreach (var castDtoModel in castDtoInput)
            {
                if (!IsValid(castDtoModel))
                {
                    sb.AppendLine(ErrorMessage);

                    continue;
                }

                var ct = new Cast()
                {
                    FullName = castDtoModel.FullName,

                    IsMainCharacter = castDtoModel.IsMainCharacter,

                    PhoneNumber = castDtoModel.PhoneNumber
                };

                var isMain = ct.IsMainCharacter ? "main" : "lesser";

                validCast.Add(ct);
                sb.AppendLine(String.Format(SuccessfulImportActor, ct.FullName, isMain));
            }
            context.Casts.AddRange(validCast);

            return sb.ToString().TrimEnd();

        }

        public static string ImportTtheatersTickets(TheatreContext context, string jsonString)
        {
            throw new NotImplementedException();
        }


        private static bool IsValid(object obj)
        {
            var validator = new ValidationContext(obj);
            var validationRes = new List<ValidationResult>();

            var result = Validator.TryValidateObject(obj, validator, validationRes, true);
            return result;
        }
    }
}
