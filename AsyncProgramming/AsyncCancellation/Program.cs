using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace AsyncCancellation
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
             CancellationTokenSource cancellationToken = new CancellationTokenSource();
             Task.Run( async () =>
                                {
                                    await Task.Delay(2000);
                                    cancellationToken.Cancel();

                                });
            try
            {
              await  MethodToBeCancelledAsync(cancellationToken.Token);
            }
             catch(OperationCanceledException)
             {
                 Console.WriteLine("Operation cancelled");
             }
            
            
             Console.WriteLine("Sum of the response is : ");
        }

         //private Task MethodToBeCancelledAsync(CancellationToken cancellationToken)
         //{
         //    throw new NotImplementedException();
         //}

         public async Task MethodToBeCancelledAsync(CancellationToken token)
        {

         for(int i = 0; i<6; i++)
         {
                Console.WriteLine("value of i: " + i);
             if(token.IsCancellationRequested)
             {
                 throw new OperationCanceledException();
             }
         }
         await Task.Delay(1000);
 	        
        }
    }
}
