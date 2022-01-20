namespace BasicWebServer.Demo
{
    using BasicWebServer.Server;

    public class StarUp
    {
        private const string HtmlForm = @"<form action='/HTML' method='POST'>
            Name: <input type='text' name='Name'/>
            Age: <input type='number' name='Age'/>
            <input type='submit' value='Save' />
        </form>";

        private const string DownloadForm = @"<form action='/Content' method='POST'>
            <input type='submit' value ='Download Sites Content' /> 
        </form>";

        private const string FileName = "content.txt";


        public static async Task Main()
        {
            await DownloadSitesAsTextFile(StarUp.FileName,
                new string[] { "https://judge.softuni.org/", "https://softuni.org/" });

            var server = await new HttpServer(routes => routes
            .MapGet("/", new TextResponse("Hello from the server!"))
            .MapGet("/Redirect", new RedirectResponse("https://softuni.org/"))
            .MapGet("/HTML", new HtmlResponse(StartUp.HtmlForm))
            .MapPost("/HTML", new TextResponse("", StartUp.AddFormDataAction))
            .MapGet("/Content", new HtmlResponse(StartUp.DownlaodForm))
            .MapPost("/Content", new TextFileResponse(StartUp.FileName)))
        .Start();

            private static async Task<string> DownloadWebSiteContent(string url)
            {
                var httpClient = new HttpClient();

                using (httpClient)
                {
                    var response = await httpClient.GetAsync(url);
                    var html = await response.Content.ReadAsStringAsync();

                    return html.Substring(0, 2000);
                }
            }

            private static async Task DownloadSitesAsTextFile(string fileName, string[] urls)
            {
                var downloads = new List<Task<string>>();

                foreach (var url in urls)
                {
                    downloads.Add(DownloadWebSiteContent(url));
                }

                var responses = await Task.WhenAll(downloads);

                var responsesString = string.Join(
                    Environment.NewLine + new String('-', 100), responses);

                await File.WriteAllTextAsync(fileName, responsesString);
            }
        }
            var server = new HttpServer("127.0.0.1", 8080);

            server.Start();
        
    }
}