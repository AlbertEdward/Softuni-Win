namespace Bank
{
    using Bank.EventMethods;
    using Bank.MoveFile;
    using Bank.SwiftParse;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text;

    class StartUp
    {
        static void Main(string[] args)
        {
            Events methods = new Events();
            string folderPath = @$"C:\Users\Albert Khurshudyan\Desktop\softuni-windows\Bank Project\BankSwift\SUCCESS";
            FileSystemWatcher watcher = new FileSystemWatcher(folderPath);
            watcher.NotifyFilter = NotifyFilters.Attributes | NotifyFilters.CreationTime | NotifyFilters.FileName | NotifyFilters.Size;
            watcher.Filter = "*.txt";
            watcher.EnableRaisingEvents = true;

            watcher.Created += methods.OnActionOnFolderPath;
            watcher.Renamed += methods.OnFileRename;

            Console.WriteLine("Press eny key to exit");
            Console.ReadLine();
        }
    }
}