public class reverseLinkedList {

    static class Node {
        int value;
        Node next;

        Node(int val) {
            value = val;
            next = null;
        }
    }

    // Reverse the linked list and return new head
    public Node reverse(Node head) {
        Node prev = null;
        Node current = head;

        while (current != null) {
            Node nextNode = current.next; // store next
            current.next = prev;          // reverse link
            prev = current;               // move prev forward
            current = nextNode;           // move current forward
        }
        return prev;
    }

    // Print all elements in the list
    public void print(Node head) {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.value);
            if (temp.next != null) System.out.print(" -> ");
            temp = temp.next;
        }
        System.out.println();
    }

    public static void main(String[] args) {
        reverseLinkedList list = new reverseLinkedList();

        Node head = new Node(1);
        head.next = new Node(2);
        head.next.next = new Node(3);
        head.next.next.next = new Node(4);
        head.next.next.next.next = new Node(5);

        System.out.println("Original list:");
        list.print(head);

        Node reversedHead = list.reverse(head);

        System.out.println("Reversed list:");
        list.print(reversedHead);
    }
}



