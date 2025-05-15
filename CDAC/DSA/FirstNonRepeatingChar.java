import java.util.*;

public class FirstNonRepeatingChar {

    static char firstNonRepeatingChar(String str) {
        Map<Character, Integer> frequency = new LinkedHashMap<>();

        // Count frequency of each character
        for (char ch : str.toCharArray()) {
            frequency.put(ch, frequency.getOrDefault(ch, 0) + 1);
        }

        // Find first character with frequency 1
        for (Map.Entry<Character, Integer> entry : frequency.entrySet()) {
            if (entry.getValue() == 1) {
                return entry.getKey();
            }
        }

        // If none found, return null character
        return '\0';
    }

    public static void main(String[] args) {
        String input = "swiss";
        char result = firstNonRepeatingChar(input);

        if (result != '\0') {
            System.out.println("First non-repeating character: " + result);
        } else {
            System.out.println("No non-repeating character found");
        }
    }
}





