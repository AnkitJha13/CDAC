public class MoveZeroesToEnd {
    public static void main(String[] args) {
        int[] arr = {0, 1, 0, 3, 12};
        moveZeroes(arr);

        System.out.print("After moving zeroes: ");
        for (int num : arr) {
            System.out.print(num + " ");
        }
    }

    static void moveZeroes(int[] arr) {
        int index = 0;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] != 0) {
                arr[index] = arr[i];
                index++;
            }
        }

        // Fill remaining positions with 0
        while (index < arr.length) {
            arr[index] = 0;
            index++;
        }
    }
}


