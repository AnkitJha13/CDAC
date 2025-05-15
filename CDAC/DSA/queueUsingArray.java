public class queueUsingArray {

    private int[] arr;
    private int front;
    private int rear;
    private int capacity;
    private int count;

    public queueUsingArray(int size) {
        arr = new int[size];
        capacity = size;
        front = 0;
        rear = -1;
        count = 0;
    }

    public void enqueue(int item) {
        if (isFull()) {
            System.out.println("Queue Overflow");
            return;
        }
        rear = (rear + 1) % capacity;
        arr[rear] = item;
        count++;
    }

    public Integer dequeue() {
        if (isEmpty()) {
            System.out.println("Queue Underflow");
            return null;
        }
        int item = arr[front];
        front = (front + 1) % capacity;
        count--;
        return item;
    }

    public Integer peek() {
        if (isEmpty()) {
            System.out.println("Queue is empty, cannot peek");
            return null;
        }
        return arr[front];
    }

    public boolean isEmpty() {
        return count == 0;
    }

    public boolean isFull() {
        return count == capacity;
    }

    public int size() {
        return count;
    }

    public static void main(String[] args) {
        queueUsingArray queue = new queueUsingArray(5);
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        System.out.println("Queue size: " + queue.size());
        System.out.println("Front element: " + queue.peek());
        System.out.println("Dequeued element: " + queue.dequeue());
        System.out.println("Queue size after dequeue: " + queue.size());
    }
}


