import java.util.HashMap;

public class FibonacciMemoization {
    private static HashMap<Integer, Long> memo = new HashMap<>();

    public static long fib(int n) {
        if (n <= 1) return n;

        if (memo.containsKey(n)) {
            return memo.get(n);
        }

        long result = fib(n - 1) + fib(n - 2);
        memo.put(n, result);
        return result;
    }

    public static void main(String[] args) {
        int N = 10;

        System.out.print("First " + N + " Fibonacci numbers: ");
        for (int i = 0; i < N; i++) {
            System.out.print(fib(i) + " ");
        }
    }
}


