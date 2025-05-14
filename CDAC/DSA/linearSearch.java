public class linearSearch {
    public static void main(String[] args) {
        int arr[] = {2, 4, 6, 8, 10, 12, 14, 16, 19};
        int target = 8;

        boolean found = false;

        for(int i=0; i<arr.length; i++){
            if(arr[i] == target){
                System.out.println("element found at index " + i);
                found = true;
                break;
            }
        }

        if(!found){
            System.out.println("element is not found " + -1);
        }
    }
}
