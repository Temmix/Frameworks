using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace AsyncProgressReporting
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
             var progress = new Progress<double>(
                 currentProgress => Console.WriteLine("Progress is : {0}", currentProgress)
                 );
         }

         private async void ProgressReporterAsync(IProgress<double> progress)
         {
             const double iterations = 10;
             for (int i = 0; i < iterations; i++)
             {
                 progress.Report(i/iterations);
                 await Task.Delay(2000);
             }
             progress.Report(1);
         }
    }
}
