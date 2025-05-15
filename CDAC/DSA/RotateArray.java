import java.util.Arrays;

public class RotateArray {

    static void rotateRight(int[] arr, int k) {
        int n = arr.length;
        k = k % n;

        reverse(arr, 0, n - 1);
        reverse(arr, 0, k - 1);
        reverse(arr, k, n - 1);
    }


    static void rotateLeft(int[] arr, int k) {
        int n = arr.length;
        k = k % n;

        reverse(arr, 0, k - 1);
        reverse(arr, k, n - 1);
        reverse(arr, 0, n - 1);
    }


    static void reverse(int[] arr, int start, int end) {
        while (start < end) {
            int temp = arr[start];
            arr[start] = arr[end];
            arr[end] = temp;
            start++;
            end--;
        }
    }

    public static void main(String[] args) {
        int[] arr1 = {1, 2, 3, 4, 5};
        int k = 2;


        rotateRight(arr1, k);
        System.out.println("Rotated right by " + k + ": " + Arrays.toString(arr1));

        int[] arr2 = {1, 2, 3, 4, 5};

        rotateLeft(arr2, k);
        System.out.println("Rotated left by " + k + ": " + Arrays.toString(arr2));
    }
}



