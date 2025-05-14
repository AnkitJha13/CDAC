import java.util.Stack;

public class stackUsingArray {

    private int[] arr;
    private int top;
    private int capacity;

    public stackUsingArray(int size) {
        arr = new int[size];
        capacity = size;
        top = -1;
    }

    public void push(int item) {
        if (isFull()) {
            System.out.println("Stack Overflow");
            return;
        }
        top++;
        arr[top] = item;
    }

    public Integer pop() {
        if (isEmpty()) {
            System.out.println("Stack Underflow");
            return null;
        }
        int poppedElement = arr[top];
        top--;
        return poppedElement;
    }

    public Integer peek() {
        if (isEmpty()) {
            System.out.println("Stack is empty, cannot peek");
            return null;
        }
        return arr[top];
    }

    public boolean isEmpty() {
        return top == -1;
    }

    public boolean isFull() {
        return top == capacity - 1;
    }

    public int size() {
        return top + 1;
    }

    public static void main(String[] args) {
        stackUsingArray stack = new stackUsingArray(5);
        stack.push(10);
        stack.push(20);
        stack.push(30);
        System.out.println("Stack size: " + stack.size());
        System.out.println("Top element: " + stack.peek());
        System.out.println("Popped element: " + stack.pop());
        System.out.println("Stack size after pop: " + stack.size());
    }
}
