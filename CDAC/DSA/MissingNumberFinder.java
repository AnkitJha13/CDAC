class MissingNumberInArray {
    public static void main(String[] args) {
        int[] arr = {1, 2, 4, 5, 6};
        int n = arr.length + 1; // total numbers should be N

        int totalSum = n * (n + 1) / 2; // sum of first N natural numbers
        int actualSum = 0;

        for (int num : arr) {
            actualSum += num;
        }

        int missing = totalSum - actualSum;
        System.out.println("Missing number is: " + missing);
    }
}
