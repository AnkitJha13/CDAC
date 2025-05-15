import java.util.Stack;

public class BalancedParentheses {
    public static void main(String[] args) {
        String input = "((()))";

        if (isBalanced(input)) {
            System.out.println("Balanced");
        } else {
            System.out.println("Not Balanced");
        }
    }

    static boolean isBalanced(String s) {
        Stack<Character> stack = new Stack<>();

        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);

            if (ch == '(') {
                stack.push(ch);
            } else if (ch == ')') {
                if (stack.isEmpty()) {
                    return false; // closing without matching opening
                }
                stack.pop();
            }
            // If other types of parentheses/brackets are present, add more checks here
        }

        return stack.isEmpty(); // true if all openings matched
    }
}



