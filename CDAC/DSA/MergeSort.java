import java.util.ArrayList;
import java.util.Arrays;

public class MergeSort {


    private static void merge(int[] arr, int low, int mid, int high) {
        ArrayList<Integer> temp = new ArrayList<>();
        int left = low;
        int right = mid + 1;

        while (left <= mid && right <= high) {
            if (arr[left] <= arr[right]) {
                temp.add(arr[left]);
                left++;
            } else {
                temp.add(arr[right]);
                right++;
            }
        }

        while (left <= mid) {
            temp.add(arr[left]);
            left++;
        }


        while (right <= high) {
            temp.add(arr[right]);
            right++;
        }



        for (int i = low; i <= high; i++) {
            arr[i] = temp.get(i - low);
        }
    }


    public static void mergeSort(int[] arr, int low, int high) {
        if (low >= high) return;

        int mid = (low + high) / 2;
        mergeSort(arr, low, mid);
        mergeSort(arr, mid + 1, high);
        merge(arr, low, mid, high);
    }


    public static void main(String[] args) {
        int[] arr = {38, 27, 43, 3, 9, 82, 10};

        mergeSort(arr, 0, arr.length - 1);

        System.out.print("After merge sort: ");
        for (int val : arr) {
            System.out.print(val + " ");
        }
    }
}


