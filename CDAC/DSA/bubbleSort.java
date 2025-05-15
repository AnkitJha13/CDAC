public class bubbleSort {  // adjacent element swapping
    public static void main(String[] args) {
        int arr[] = {13, 46, 24, 52, 20, 9};
        int n = arr.length;

        for(int i=0;i<n-1;i++){
            int didSwap = 0;
            for(int j=0;j<n-1-i;j++){
                if(arr[j] > arr[j+1]){
                    int temp = arr[j+1];
                    arr[j+1] = arr[j];
                    arr[j] = temp;
                    didSwap = 1;
                }
            }
            if(didSwap == 0){
                break;
            }
        }

        System.out.print("Sorted array: ");
        for (int val : arr) {
            System.out.print(val + " ");
        }
    }
}


