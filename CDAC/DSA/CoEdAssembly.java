import java.util.*;

public class CoEdAssembly {

    static class AssemblyQueue {
        List<String> queue = new ArrayList<>();
        int sentToStage = 0;
        char expectedGender = 'F'; // Always start with Female

        void addStudent(String name, char gender) {
            if (gender == expectedGender) {
                queue.add(name);
                expectedGender = (gender == 'F') ? 'M' : 'F'; // alternate
            } else {
                sentToStage++; // sent to stage
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
        int n = Integer.parseInt(sc.nextLine()); // read number of students

        AssemblyQueue queue = new AssemblyQueue();

        for (int i = 0; i < n; i++) {
            String line = sc.nextLine();

            // Find the first space
            int spaceIndex = -1;
            for (int j = 0; j < line.length(); j++) {
                if (line.charAt(j) == ' ') {
                    spaceIndex = j;
                    break;
                }
            }

            if (spaceIndex == -1 || spaceIndex == line.length() - 1) {
                continue; // invalid line
            }

            String name = line.substring(0, spaceIndex);

            // Skip spaces after name to find gender
            int genderIndex = spaceIndex + 1;
            while (genderIndex < line.length() && line.charAt(genderIndex) == ' ') {
                genderIndex++;
            }

            if (genderIndex >= line.length()) continue; // no gender found

            char gender = line.charAt(genderIndex);

            queue.addStudent(name, gender);
        }

        queue.printQueue();
        queue.printSentCount();
    }
}
