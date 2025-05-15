import java.util.*;

public class AlternateNodeDeletion {

    // Node class for singly linked list
    static class Node {
        int data;
        Node next;

        Node(int data) {
            this.data = data;
            this.next = null;
        }
    }

    // Function to delete alternate nodes starting from second
    public static Node deleteAlternateNodes(Node head) {
        if (head == null) return null;

        Node current = head;
        while (current != null && current.next != null) {
            current.next = current.next.next;
            current = current.next;
        }
        return head;
    }

    // Function to print the list in reverse using a stack
    public static void printReverse(Node head) {
        Stack<Integer> stack = new Stack<>();
        Node current = head;
        while (current != null) {
            stack.push(current.data);
            current = current.next;
        }
        while (!stack.isEmpty()) {
            System.out.print(stack.pop() + " ");
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt(); // Number of nodes
        if (n <= 0) {
            System.out.println();
            return;
        }

        Node head = new Node(sc.nextInt()); // Read first node
        Node tail = head;

        for (int i = 1; i < n; i++) {
            tail.next = new Node(sc.nextInt());
            tail = tail.next;
        }

        head = deleteAlternateNodes(head);
        printReverse(head);
    }
}



// 5
// 1 2 3 4 5


