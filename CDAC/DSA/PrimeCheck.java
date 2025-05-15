public class PrimeCheck {
    public static void main(String[] args) {
        int num = 16;
        if (isPrime(num)) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
    }

    static boolean isPrime(int n) {
        if (n <= 1) return false;  // 0 and 1 are not prime
        for (int i = 2; i * i <= n; i++) {  // check till sqrt(n)
            if (n % i == 0) {
                return false;  // divisible, not prime
            }
        }
        return true;  // prime
    }
}
