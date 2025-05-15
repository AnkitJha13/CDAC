public class ReverseString {
    public static void main(String[] args) {
        String input = "hello";
        char[] chars = input.toCharArray(); // Convert string to character array

        int left = 0;
        int right = chars.length - 1;

        while (left < right) {
            // Swap characters at left and right
            char temp = chars[left];
            chars[left] = chars[right];
            chars[right] = temp;

            left++;
            right--;
        }

        // Convert the character array back to a string
        String reversed = new String(chars);
        System.out.println("Reversed string: " + reversed);
    }
}
