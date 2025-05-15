public class insertionSort {
    public static void main(String[] args) {
        int[] arr = {13, 46, 24, 52, 20, 9};
        int n = arr.length;

        // Insertion sort using swapping logic
        for (int i = 0; i <= n - 1; i++) {
            int j = i;
            while (j > 0 && arr[j - 1] > arr[j]) {
                // Swap arr[j-1] and arr[j]
                int temp = arr[j - 1];
                arr[j - 1] = arr[j];
                arr[j] = temp;
                j--;
            }
        }

        System.out.print("Sorted array: ");
        for (int val : arr) {
            System.out.print(val + " ");
        }
    }
}
