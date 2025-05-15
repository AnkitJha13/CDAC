import java.util.*;

public class ArrayIntersection {
    public static void main(String[] args) {
        int[] arr1 = {1, 2, 4, 5};
        int[] arr2 = {2, 4, 6, 8};

        List<Integer> intersection = findIntersection(arr1, arr2);

        System.out.print("Intersection: ");
        for (int num : intersection) {
            System.out.print(num + " ");
        }
    }

    static List<Integer> findIntersection(int[] arr1, int[] arr2) {
        List<Integer> result = new ArrayList<>();
        Set<Integer> set = new HashSet<>();

        // Add elements of arr1 to set
        for (int num : arr1) {
            set.add(num);
        }

        // Check elements in arr2 and if present in set, add to result
        for (int num : arr2) {
            if (set.contains(num)) {
                result.add(num);
                set.remove(num); // To avoid duplicates in output
            }
        }

        return result;
    }
}
