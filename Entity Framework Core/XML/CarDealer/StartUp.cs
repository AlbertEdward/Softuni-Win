﻿namespace CarDealer
{
    using CarDealer.Data;
    using CarDealer.DTO.Import;
    using CarDealer.Models;
    using System.Collections;
    using System.Collections.Generic;
    using System.IO;
    using System.Xml.Serialization;

    public class StartUp
    {
        public static void Main(string[] args)
        {
            CarDealerContext dbContext = new CarDealerContext();

            //ResetDb(dbContext);

            string inputXml = File.ReadAllText("../../../Datasets/parts.xml");
            string result = ImportParts(dbContext, inputXml);

            System.Console.WriteLine(result);
        }

        //09. Import Suppliers
        public static string ImportSuppliers(CarDealerContext context, string inputXml)
        {
            XmlRootAttribute xmlRoot = new XmlRootAttribute("Suppliers");
            XmlSerializer xmlSerializer = new XmlSerializer(
                typeof(ImportSupplierDto[]), xmlRoot);

            using StringReader stringReader = new StringReader(inputXml);

            ImportSupplierDto[] dtos = (ImportSupplierDto[]) 
                xmlSerializer.Deserialize(stringReader);

            ICollection<Supplier> suppliers = new HashSet<Supplier>();
            foreach (ImportSupplierDto supplierDto in dtos)
            {
                Supplier s = new Supplier()
                {
                    Name = supplierDto.Name,
                    IsImporter = bool.Parse(supplierDto.IsImporter)
                };

                suppliers.Add(s);
            }

            context.Suppliers.AddRange(suppliers);
            context.SaveChanges();

            return $"Successfully imported {suppliers.Count}";
        }

        //10. Import Parts
        public static string ImportParts(CarDealerContext context, string inputXml)
        {
            XmlRootAttribute xmlRoot = new XmlRootAttribute("Parts");
            XmlSerializer xmlSerializer = new XmlSerializer(
                typeof(ImportPartDto[]), xmlRoot);

            using StringReader stringReader = new StringReader(inputXml);

            ImportPartDto[] partDtos = (ImportPartDto[])
                xmlSerializer.Deserialize(stringReader);

            ICollection<Part> parts = new HashSet<Part>();
            foreach (ImportPartDto partDto in partDtos)
            {
                Supplier supplier = context
                    .Suppliers
                    .Find(partDto.SupplierId);

                if (supplier == null)
                {
                    continue;
                }

                Part p = new Part()
                {
                    Name = partDto.Name,
                    Price = decimal.Parse(partDto.Price),
                    Quantity = partDto.Quantity,
                    Supplier = supplier
                };

                parts.Add(p);
            }

            context.Parts.AddRange(parts);
            context.SaveChanges();


            return $"Successfully imported {parts.Count}";
        }

        //11. Import Cars
        public static string ImportCars(CarDealerContext context, string inputXml)
        {
            XmlRootAttribute xmlRoot = new XmlRootAttribute("Parts");
            XmlSerializer xmlSerializer = new XmlSerializer(
                typeof(ImportPartDto[]), xmlRoot);


            return $"Successfully imported {cars.Count}";
        }

        private static void ResetDb(CarDealerContext dbContext)
        {
            dbContext.Database.EnsureDeleted();
            dbContext.Database.EnsureCreated();

            System.Console.WriteLine("DB reset was successful!");
        }
    }
}