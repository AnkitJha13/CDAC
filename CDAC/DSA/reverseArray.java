import java.util.Scanner;

public class reverseArray {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Total number of elements: ");
        int n = sc.nextInt();

        int[] arr = new int[n];


        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }


        int start = 0, end = n - 1;
        while (start < end) {
            int temp = arr[start];
            arr[start] = arr[end];
            arr[end] = temp;
            start++;
            end--;
        }


        System.out.println("Reversed array:");
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
    }
}
