import java.util.Scanner;
import java.util.Stack;

public class checkPalindromeUsingStack {
    public static boolean isPalindrome(String str) {

        Stack<Character> stack = new Stack<>();


        for (int i = 0; i < str.length(); i++) {
            stack.push(str.charAt(i));
        }

        // Check by popping and comparing
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) != stack.pop()) {
                return false;
            }
        }

        return true;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a string: ");
        String input = sc.nextLine();
        sc.close();

        if (isPalindrome(input)) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
    }
}
