using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AsyncAwaitingInSequence
{
    class Program
    {
        static void Main(string[] args)
        {
            var program = new Program();
            program.StartAsnc();

            Console.WriteLine("Back in Main after calling StartAsync Method");
            Console.ReadLine();
        }

         private async void StartAsnc()
        {
 	        Console.WriteLine("Runninng StartAsnc Method");

             int response1 = await MethodOneAsync();
             Console.WriteLine("MethodOneAsync Method Completed");

             int response2 = await MethodTwoAsync();
             Console.WriteLine("MethodTwoAsync Method Completed");

             int response3 = await MethodThreeAsync();
             Console.WriteLine("MethodThreeAsync Method Completed");

             int responseSum = response1 + response2 + response3;
             Console.WriteLine("Sum of Responses : " + responseSum);
        }


         private async Task<int> MethodOneAsync()
        {
 	        Console.WriteLine("Runninng ReturnValueAsync Method");
            await Task.Delay(2000);
            return 5;
        }
      private async Task<int> MethodTwoAsync()
        {
 	        Console.WriteLine("Runninng ReturnValueAsync Method");
            await Task.Delay(1000);
            return 7;
        }
      private async Task<int> MethodThreeAsync()
        {
 	        Console.WriteLine("Runninng ReturnValueAsync Method");
            await Task.Delay(500);
            return 9;
        }
    }
}
