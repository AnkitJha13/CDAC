import java.util.Scanner;

public class maxInArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Total number of elements: ");
        int n = sc.nextInt();

        int max = Integer.MIN_VALUE;

        for (int i = 0; i < n; i++) {
            int num = sc.nextInt();
            if (num > max) {
                max = num;
            }
        }

        System.out.println("Maximum element: " + max);

    }
}
