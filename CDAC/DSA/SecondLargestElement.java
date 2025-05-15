public class SecondLargestElement {
    public static int findSecondLargest(int[] arr) {
        if (arr.length < 2) {
            System.out.println("Array must have at least two elements");
            return Integer.MIN_VALUE; // indicates no valid second largest
        }

        int largest = Integer.MIN_VALUE;
        int secondLargest = Integer.MIN_VALUE;

        for (int num : arr) {
            if (num > largest) {
                secondLargest = largest;
                largest = num;
            } else if (num > secondLargest && num != largest) {
                secondLargest = num;
            }
        }

        if (secondLargest == Integer.MIN_VALUE) {
            System.out.println("No second largest element found");
            return Integer.MIN_VALUE;
        }

        return secondLargest;
    }

    public static void main(String[] args) {
        int[] arr = {10, 20, 4, 45, 99};
        int result = findSecondLargest(arr);
        if (result != Integer.MIN_VALUE) {
            System.out.println("Second largest element is: " + result);
        }
    }
}
