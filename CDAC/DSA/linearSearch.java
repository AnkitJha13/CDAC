public class linearSearch {
    public static void main(String[] args) {
        int[] arr = {2, 4, 6, 8, 10, 12, 14, 16, 19};
        int target = 8;

        int result = -1;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                result = i;
                break;
            }
        }

        System.out.println(result);
    }
}


