using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace BasicWebServer
{
    class Program
    {
        static void Main(string[] args)
        {
            var ipAddress = IPAddress.Parse("127.0.0.1");
            var port = 8080;

            var serverListener = new TcpListener(ipAddress, port);  

            serverListener.Start();

            Console.WriteLine($"Server started on port {port}");
            Console.WriteLine("Listening for requests");

            while (true)
            {
                var connection = serverListener.AcceptTcpClient();

                var networkStream = connection.GetStream();

                var content = "Hello from the server!";
                var contentLenght = Encoding.UTF8.GetByteCount(content);

                var respose = $@"HTTP/1.1 200 OK
Content-Type: text/plain; charset=UTF-8
Content-Length: {contentLenght}

{content}";

                var resposeBytes = Encoding.UTF8.GetBytes(respose);

                networkStream.Write(resposeBytes);

                connection.Close();
            }
        }
    }
}
