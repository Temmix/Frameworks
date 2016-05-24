using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AsyncProgramming
{
    class Program
    {
        static void Main(string[] args)
        {
            var program = new Program();
            program.StartAsync();

            Console.WriteLine("DoNetworkCommunication is running now");
            Console.ReadLine();
        }
    

    public async void StartAsync()
    {
        await DoNetworkCommunicationsAsync();
    }

        public async Task DoNetworkCommunicationsAsync()
        {
            Console.WriteLine(DateTime.Now.ToString());
            await Task.Delay(5000);
            Console.WriteLine(DateTime.Now.ToString());
        }
    }
}
