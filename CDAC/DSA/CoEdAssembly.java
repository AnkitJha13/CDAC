import java.util.*;

public class CoEdAssembly {

    static class AssemblyQueue {
        List<String> queue = new ArrayList<>();
        int sentToStage = 0;
        char expectedGender = 'F'; // Start with Female

        void addStudent(String name, char gender) {
            if (queue.isEmpty()) {
                queue.add(name);
                expectedGender = (gender == 'F') ? 'M' : 'F';
            } else if (gender == expectedGender) {
                queue.add(name);
                expectedGender = (gender == 'F') ? 'M' : 'F';
            } else {
                sentToStage++;
            }
        }

        void printQueue() {
            for (int i = 0; i < queue.size(); i++) {
                System.out.print(queue.get(i));
                if (i != queue.size() - 1) System.out.print(" => ");
            }
            System.out.println("=>");
        }

        void printSentCount() {
            System.out.println(sentToStage);
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine(); // consume newline

        AssemblyQueue queue = new AssemblyQueue();

        for (int i = 0; i < n; i++) {
            String line = sc.nextLine();

            // Manually parse line to get name and gender without using split or trim
            int spaceIndex = -1;
            for (int j = 0; j < line.length(); j++) {
                if (line.charAt(j) == ' ') {
                    spaceIndex = j;
                    break;
                }
            }

            if (spaceIndex == -1 || spaceIndex == line.length() - 1) {
                // Invalid line, skip
                continue;
            }

            String name = line.substring(0, spaceIndex);
            char gender = line.charAt(spaceIndex + 1);

            queue.addStudent(name, gender);
        }

        queue.printQueue();
        queue.printSentCount();
    }
}



