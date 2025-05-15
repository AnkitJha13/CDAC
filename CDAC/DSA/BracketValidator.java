import java.util.*;

public class BracketValidator {

    public static boolean isValid(String str) {
        Stack<Character> stack = new Stack<>();

        for (char ch : str.toCharArray()) {
            // If it's an opening bracket, push it to the stack
            if (ch == '(' || ch == '[' || ch == '{') {
                stack.push(ch);
            }
            // If it's a closing bracket, ensure it matches the top of the stack
            else if (ch == ')' || ch == ']' || ch == '}') {
                if (stack.isEmpty()) return false;

                char top = stack.pop();
                if ((ch == ')' && top != '(') ||
                        (ch == ']' && top != '[') ||
                        (ch == '}' && top != '{')) {
                    return false;
                }
            }
            // Ignore non-bracket characters
        }

        // If the stack is empty, all brackets were matched
        return stack.isEmpty();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextLine()) {
            String str = sc.nextLine();

            if (str.isEmpty()) break;

            if (isValid(str)) {
                System.out.println("TRUE");
            } else {
                System.out.println("FALSE");
            }
        }
    }
}


// (the[is]{valid})
// (the[is]{valid))
// {the(is[valid])}
// (this](is}{valid)







