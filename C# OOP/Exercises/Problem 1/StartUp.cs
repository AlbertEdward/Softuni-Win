using System;
using System.Collections.Generic;
using System.Linq;

namespace Problem_1
{
    public class StartUp
    {
        static void Main(string[] args)
        {
            Console.Write("Enter Barcode Path: ");
            string input = Console.ReadLine();

            Console.WriteLine("Enter quantity: ");
            int quantity = int.Parse(Console.ReadLine());

            List<long> barcodes = new List<long>();

            for (int i = 0; i < quantity; i++)
            {
                barcodes.Add(long.Parse(input) + i);
            }

            List<int> barcode = new List<int>();

            for (int i = 0; i < input.Length; i++)
            {
                int a = int.Parse(input.Substring(i, 1));
                barcode.Add(a);
            }

            int evenNumbers = 0;
            int oddNumbers = 0;
            int counter = 1;

            for (int i = 0; i < barcode.Count - 1; i++)
            {
                if (counter % 2 == 0)
                {
                    evenNumbers += barcode[i];
                }
                else
                {
                    oddNumbers += barcode[i];
                }

                counter++;
            }

            evenNumbers *= 3;

            int sumEvenOdd = evenNumbers + oddNumbers;

            int checkDigit = 10 - (sumEvenOdd % 10);

            int lastDigitOfBarcode = barcode[barcode.Count - 1];

            if (checkDigit == lastDigitOfBarcode)
            {
                Console.WriteLine("Success! The Barcode is Valid");
            }
            else
            {
                Console.WriteLine("Invalid Barcode");
            }
            
        }
    }
}

// 3 8 0 0 0 6 5 7 1  1  1  3     5
// 1 2 3 4 5 6 7 8 9 10 11 12    13
// 1. Add the even number digits: 8 + 0 + 6 + 7 + 1 + 3 = 25
// 2. Multiply the result by 3: 25 × 3 = 75
// 3. Add the odd number digits: 3 + 0 + 0 + 5 + 1 + 1 = 10
// 4. Add the two results together: 75 + 10 = 85
/* 5. To calculate the check digit, take the remainder of 
    (85 / 10), which is also known as (85 modulo 10),
    and if not 0, subtract from 10. Therefore, the 
    check digit value is 5. i.e. (85 / 10) = 8 remainder 5; 10 - 5 = 5.

3800065711135
*/