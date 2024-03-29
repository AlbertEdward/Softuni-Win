﻿using Bank.SwiftParse;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bank.MoveFile
{
    public class MoveToFolder
    {
        public string MoveFileToFolder(string fileName, bool isCorrectFail)
        {
            StringBuilder sb = new StringBuilder();
            string fileMoveToDestionation = @$"C:\Users\Albert Khurshudyan\Desktop\softuni-windows\Bank Project\BankSwift\SUCCESS\{fileName}";

            if (isCorrectFail)
            {
                string successDestination = @$"C:\Users\Albert Khurshudyan\Desktop\softuni-windows\Bank Project\BankSwift\SUCCESS\{fileName}";
                File.Move(fileMoveToDestionation, successDestination);

                sb.AppendLine($"File is success and moved to Folder -> SUCCESS");
            }
            else
            {
                string filedDestination = @$"C:\Users\Albert Khurshudyan\Desktop\softuni-windows\Bank Project\BankSwift\FAILED\{fileName}";
                File.Move(fileMoveToDestionation, filedDestination);
                sb.AppendLine(@"File is failed and move to Folder -> FAILED");
            }
            return sb.ToString().TrimEnd();
        }
    }
}