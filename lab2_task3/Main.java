import java.util.*;

public class Main {
    public static int countSequences(List<Integer> sequence) {
        if (sequence.size() < 2) return 0;
        
        int seqLen = 1;
        int seqCount = 0;
        
        for (int i = 0; i < sequence.size() - 1; i++) {
            if (sequence.get(i+1) >= sequence.get(i)) {
                seqLen++;
            } else if (seqLen > 1) {
                seqCount++;
                seqLen = 1;
            } else {
                seqLen = 1;
            }
        }
        
        if (seqLen > 1) seqCount++;
        
        return seqCount;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Введите последовательность чисел через пробел:");
        String[] input = sc.nextLine().split(" ");
        List<Integer> nums = new ArrayList<>();
        for (String s : input) {
            nums.add(Integer.parseInt(s));
        }
        System.out.println(countSequences(nums));
    }
}