import java.util.Arrays;

public class LongestCommonPrefix {
    public static void main(String[] args) {
        String[] strs = {"flower", "flow", "flight"};
        LongestCommonPrefix obj = new LongestCommonPrefix();
        String prefix = obj.longestCommonPrefix(strs);
        System.out.println("Longest common prefix: " + prefix);
    }

    public String longestCommonPrefix(String[] strs) {
        int n = strs.length;
        if (n == 0) return "";  // Handle empty array

        Arrays.sort(strs);  // Sort array lexicographically

        String a = strs[0];       // First string after sorting
        String b = strs[n - 1];   // Last string after sorting

        String ans = "";
        for (int i = 0; i < a.length(); i++) {
            if (a.charAt(i) == b.charAt(i)) {
                ans += a.charAt(i);  // Append matching chars
            } else {
                break;  // Stop at first mismatch
            }
        }

        return ans;
    }
}
