using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AsyncAwaitingInParallel
{
    class Program
    {
        static void Main(string[] args)
        {
            var program = new Program();
            program.StartAsync();
            Console.WriteLine("Running all the methods in Parallel");
            Console.ReadKey();
        }

        public async void StartAsync()
        {
            var tasks = new List<Task<int>>
                        {
                            MethodOneAsync(),
                            MethodTwoAsync(),
                            MethodThreeAsync()
                        };
            Console.WriteLine("Running all 3 methods in Parallel");
            int[] responses = await Task.WhenAll(tasks);
            Console.WriteLine("Sum of the response is : " + responses.Sum());
        }

        private async Task<int> MethodOneAsync()
        {
            Console.WriteLine("Running MethodOneAsync Method");
            await Task.Delay(5000);
            Console.WriteLine("Completed MethodOneAsync Method");
            return 5;
        }
        private async Task<int> MethodTwoAsync()
        {
            Console.WriteLine("Running MethodTwoAsync Method");
            await Task.Delay(3000);
            Console.WriteLine("Completed MethodTwoAsync Method");
            return 7;
        }
        private async Task<int> MethodThreeAsync()
        {
            Console.WriteLine("Running MethodThreeAsync Method");
            await Task.Delay(500);
            Console.WriteLine("Completed MethodThreeAsync Method");
            return 9;
        }
    }
}
