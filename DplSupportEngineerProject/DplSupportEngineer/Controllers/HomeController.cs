using DplSupportEngineer.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf;
using Telerik.Windows.Documents.Spreadsheet.Model;

namespace DplSupportEngineer.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            this._logger = logger;
        }

        public IActionResult Index()
        {
            return this.View();
        }

        public IActionResult Privacy()
        {
            return this.View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return this.View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? this.HttpContext.TraceIdentifier });
        }

        public IActionResult PdfExport()
        {
            Stream documentStream = this.GetEmbeddedDocument();

            Workbook workbook = null;
            using (documentStream)
            {
                XlsxFormatProvider xlsxFormatProvider = new XlsxFormatProvider();
                workbook = xlsxFormatProvider.Import(documentStream);
            }

            workbook.ActiveWorksheet.Columns[0, 1].AutoFitWidth();

            using (MemoryStream stream = new MemoryStream())
            {
                PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
                pdfFormatProvider.Export(workbook, stream);

                stream.Seek(0, SeekOrigin.Begin);

                return File(stream.ToArray(), "application/pdf", "Document.pdf");
            }
        }

        private Stream GetEmbeddedDocument()
        {
            Assembly assembly = typeof(HomeController).Assembly;
            string resourceName = assembly.GetManifestResourceNames().FirstOrDefault(p => p.Contains("Document"));

            if (!string.IsNullOrEmpty(resourceName))
            {
                Stream resourceStream = assembly.GetManifestResourceStream(resourceName);
                return resourceStream;
            }

            return null;
        }
    }
}
