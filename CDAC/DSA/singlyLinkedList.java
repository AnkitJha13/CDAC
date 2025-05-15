import java.util.Scanner;

public class singlyLinkedList {
    static class Node {
        int data;
        Node next;
        Node(int val) {
            data = val;
        }
    }

    static Node head;

    public static void insert(int val) {
        Node newNode = new Node(val);
        if (head == null) {
            head = newNode;
            return;
        }
        Node curr = head;
        while (curr.next != null) curr = curr.next;
        curr.next = newNode;
    }

    public static void delete(int val) {
        if (head == null) return;
        if (head.data == val) {
            head = head.next;
            return;
        }
        Node curr = head;
        while (curr.next != null && curr.next.data != val) {
            curr = curr.next;
        }
        if (curr.next != null) {
            curr.next = curr.next.next;
        }
    }

    public static void printList() {
        for (Node curr = head; curr != null; curr = curr.next) {
            System.out.print(curr.data + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            String command = sc.next();
            if (command.equals("end")) break;
            int val = sc.nextInt();
            if (command.equals("insert")){
                insert(val);
            }
            else if (command.equals("delete")){
                delete(val);
            }
        }
        printList();
        sc.close();
    }
}
