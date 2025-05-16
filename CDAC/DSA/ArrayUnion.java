import java.util.*;

public class ArrayUnion {  
    static List<Integer> findUnion(int[] arr1, int[] arr2) {
        Set<Integer> set = new LinkedHashSet<>();

        // Add all elements from arr1
        for (int num : arr1) {
            set.add(num);
        }

        // Add all elements from arr2
        for (int num : arr2) {
            set.add(num); // Duplicates will be ignored automatically
        }

        // Convert set to list if you want ordered output
        return new ArrayList<>(set);
    }

    public static void main(String[] args) {
        int[] arr1 = {1, 2, 4, 5};
        int[] arr2 = {2, 4, 6, 8};

        List<Integer> union = findUnion(arr1, arr2);

        System.out.print("Union: ");
        for (int num : union) {
            System.out.print(num + " ");
        }
    }
}
