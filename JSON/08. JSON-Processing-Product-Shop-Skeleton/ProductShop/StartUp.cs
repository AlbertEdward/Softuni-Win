using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ProductShop.Data;
using ProductShop.Dtos;
using ProductShop.Models;

namespace ProductShop
{
    public class StartUp
    {
        private static IMapper mapper;
        
        public static void Main(string[] args)
        {
            ProductShopContext context = new ProductShopContext();
            //context.Database.EnsureDeleted();
            //context.Database.EnsureCreated();

            //string usersJsonAsString = File.ReadAllText("../../../Datasets/users.json");
            //string productsJsonAsString = File.ReadAllText("../../../Datasets/products.json");
            //string categoriesJsonAsString = File.ReadAllText("../../../Datasets/categories.json");
            //string cProductsJsonAsString = File.ReadAllText("../../../Datasets/categories-products.json");

            //Console.WriteLine(ImportUsers(context, usersJsonAsString));
            //Console.WriteLine(ImportProducts(context, productsJsonAsString));
            //Console.WriteLine(ImportCategories(context, categoriesJsonAsString));
            //Console.WriteLine(ImportCategoryProducts(context, cProductsJsonAsString));

            //Console.WriteLine(GetProductsInRange(context));
            Console.WriteLine(GetSoldProducts(context));
        }

        //01. Import Users
        public static string ImportUsers(ProductShopContext context, string inputJson)
        {
            IEnumerable<UserInputDto> users = JsonConvert.DeserializeObject<IEnumerable<UserInputDto>>(inputJson);

            var mapperConfiguration = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<ProductShopProfile>();

            });

            IMapper mapper = new Mapper(mapperConfiguration);

            IEnumerable<User> mappedUsers = mapper.Map<IEnumerable<User>>(users);


            context.Users.AddRange(mappedUsers);
            context.SaveChanges();

            return $"Successfully imported {mappedUsers.Count()}";
        }

        //02. Import Products
        public static string ImportProducts(ProductShopContext context, string inputJson)
        {
            IEnumerable<ProductInputDto> products = JsonConvert.DeserializeObject<IEnumerable<ProductInputDto>>(inputJson);

            InitializeMapper();

            var mappedProducts = mapper.Map<IEnumerable<Product>>(products);

            context.Products.AddRange(mappedProducts);
            context.SaveChanges();

            return $"Successfully imported {mappedProducts.Count()}";
        }

        //03. Import Categories
        public static string ImportCategories(ProductShopContext context, string inputJson)
        {
            IEnumerable<CategoryInputDto> categories = JsonConvert.DeserializeObject<IEnumerable<CategoryInputDto>>(inputJson)
                .Where(x => !(string.IsNullOrEmpty(x.Name)));

            InitializeMapper();

            var mappedCategory = mapper.Map<IEnumerable<Category>>(categories);

            context.Categories.AddRange(mappedCategory);
            context.SaveChanges();

            return $"Successfully imported {mappedCategory.Count()}";
        }

        //04. Import Categories and Products
        public static string ImportCategoryProducts(ProductShopContext context, string inputJson)
        {
            IEnumerable<CategoryProductInputDto> CProcducts = JsonConvert.DeserializeObject<IEnumerable<CategoryProductInputDto>>(inputJson);

            InitializeMapper();

            var mappedCProducts = mapper.Map<IEnumerable<CategoryProduct>>(CProcducts);
            context.CategoryProducts.AddRange(mappedCProducts);
            context.SaveChanges();

            return $"Successfully imported {CProcducts.Count()}";
        }

        //05. Export Products In Range
        public static string GetProductsInRange(ProductShopContext context)
        {
            var products = context.Products
                .Where(x => x.Price >= 500 && x.Price <= 1000)
                .OrderBy(x => x.Price)
                .Select(x => new
                {
                    name = x.Name,
                    price = x.Price,
                    seller = $"{x.Seller.FirstName} {x.Seller.LastName}"
                })
                .ToList();

            InitializeMapper();

            string productsAsJson = JsonConvert.SerializeObject(products, Formatting.Indented);


            return productsAsJson;
        }

        //06. Export Sold Products
        public static string GetSoldProducts(ProductShopContext context)
        {
            var usersWithSoldProducts = context
                .Users
                .Include(x => x.ProductsSold)
                .Where(x => x.ProductsSold.Any(y => y.Buyer != null))
                .OrderBy(x => x.LastName)
                .ThenBy(x => x.FirstName)
                .Select(x => new
                {
                    FirstName = x.FirstName,
                    LastName = x.LastName,
                    SoledProducts = x.ProductsSold.Select(p => new
                        {
                            Name = p.Name,
                            Price = p.Price,
                            BuyerFirstName = p.Buyer.FirstName,
                            BuyerLastName = p.Buyer.LastName
                        })
                    .ToList()
                })
                .ToList();

            InitializeMapper();

            string productsAsJson = JsonConvert.SerializeObject(usersWithSoldProducts, Formatting.Indented);

            return "";
        }

        private static void InitializeMapper()
        {
            var mapperConfiguration = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<ProductShopProfile>();
            });

            mapper = new Mapper(mapperConfiguration);
        }
    }
}