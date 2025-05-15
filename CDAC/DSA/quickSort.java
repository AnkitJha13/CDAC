import java.util.*;

public class quickSort {
    // Partition method
    static int partition(List<Integer> arr, int low, int high) {
        int pivot = arr.get(low);
        int i = low;
        int j = high;

        while (i < j) {
            while (i <= high - 1 && arr.get(i) <= pivot) {
                i++;
            }
            while (j >= low + 1 && arr.get(j) > pivot) {
                j--;
            }
            if (i < j) {
                int temp = arr.get(i);
                arr.set(i, arr.get(j));
                arr.set(j, temp);
            }
        }

        int temp = arr.get(low);
        arr.set(low, arr.get(j));
        arr.set(j, temp);

        return j;
    }

    // Quick sort method
    static void qs(List<Integer> arr, int low, int high) {
        if (low < high) {
            int pIndex = partition(arr, low, high);
            qs(arr, low, pIndex - 1);
            qs(arr, pIndex + 1, high);
        }
    }

    public static void main(String[] args) {
        List<Integer> arr = new ArrayList<>(Arrays.asList(29, 10, 14, 37, 13));

        qs(arr, 0, arr.size() - 1);

        System.out.print("After quick sort: ");
        for (int val : arr) {
            System.out.print(val + " ");
        }
    }
}





