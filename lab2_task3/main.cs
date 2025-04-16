using System;
using System.Collections.Generic;
using System.Linq;

class Program {
    static int CountSequences(List<int> sequence) {
        if (sequence.Count < 2) return 0;
        
        int seqLen = 1;
        int seqCount = 0;
        
        for (int i = 0; i < sequence.Count - 1; i++) {
            if (sequence[i+1] >= sequence[i]) {
                seqLen++;
            }
            else if (seqLen > 1) {
                seqCount++;
                seqLen = 1;
            }
            else {
                seqLen = 1;
            }
        }
        
        if (seqLen > 1) seqCount++;
        
        return seqCount;
    }

    static void Main() {
        Console.WriteLine("Введите последовательность чисел через пробел:");
        List<int> nums = Console.ReadLine().Split()
                          .Select(int.Parse).ToList();
        Console.WriteLine(CountSequences(nums));
    }
}