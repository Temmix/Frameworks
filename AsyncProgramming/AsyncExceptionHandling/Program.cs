using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AsyncExceptionHandling
{
    class Program
    {
        static void Main(string[] args)
        {
            var program = new Program();
            program.StartAsync();

            Console.ReadKey();
        }

         public async void StartAsync()
         {
            try
            {
                MethodVoidAsync();
            }
             catch(NotImplementedException)
             {
                 Console.WriteLine("Sorry you can not catch this exception :)");
             }
             try
             {
                 await MethodTaskAsync();
             }
             catch(NotImplementedException ex)
             {
                 Console.WriteLine("The exception is "+  ex.ToString());
             }
            
             Console.WriteLine("Sum of the response is : ");
        }

     private async void MethodVoidAsync()
        {
            await Task.Delay(1000);
 	        Console.WriteLine("Runninng MethodVoidAsync Method");
            throw  new NotImplementedException();
        }
      private async Task MethodTaskAsync()
      {
            await Task.Delay(1000);
 	        Console.WriteLine("Runninng MethodTaskAsync Method");
            throw  new NotImplementedException();
        }
    }
}
