using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AsynReturnValue
{
    class Program
    {
        static void Main(string[] args)
        {
        }
    
        
        public async void StartAsync()
        {
            FireAndForgetAsync();
            await DoNotReturnValueAsync();
        }

        private async void FireAndForgetAsync()
        {
 	        Console.WriteLine("Runninng FireAndForget Method");
            await Task.Delay(2000);
        }

        private async Task DoNotReturnValueAsync()
        {
 	        Console.WriteLine("Runninng DoNotReturnValueAsync Method");
            await Task.Delay(2000);
        }

        private async Task<int> ReturnValueAsync()
        {
 	        Console.WriteLine("Runninng ReturnValueAsync Method");
            await Task.Delay(2000);
            return 5;
        }
    }
}
