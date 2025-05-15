import java.util.Arrays;

public class AnagramCheck {

    static boolean areAnagrams(String s1, String s2) {
        // If lengths differ, they can't be anagrams
        if (s1.length() != s2.length()) {
            return false;
        }

        // Convert strings to char arrays
        char[] arr1 = s1.toCharArray();
        char[] arr2 = s2.toCharArray();

        Arrays.sort(arr1);
        Arrays.sort(arr2);

        // Compare sorted arrays
        for (int i = 0; i < arr1.length; i++) {
            if (arr1[i] != arr2[i]) {
                return false;
            }
        }

        return true;
    }


    public static void main(String[] args) {
        String str1 = "listen";
        String str2 = "silent";

        if (areAnagrams(str1, str2)) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
    }
}
