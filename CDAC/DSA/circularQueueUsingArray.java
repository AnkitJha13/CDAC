public class circularQueueUsingArray {

    static int[] arr;
    static int front, size, capacity;

    // Initialize queue
    public static void initQueue(int c) {
        arr = new int[c];
        capacity = c;
        front = 0;
        size = 0;
    }

    public static void enqueue(int x) {
        if (size == capacity) {
            System.out.println("Queue is full. Cannot enqueue " + x);
            return;
        }
        int rear = (front + size) % capacity;
        arr[rear] = x;
        size++;
        System.out.println("Enqueued: " + x);
    }

    public static int dequeue() {
        if (size == 0) {
            System.out.println("Queue is empty. Cannot dequeue.");
            return -1;
        }
        int result = arr[front];
        front = (front + 1) % capacity;
        size--;
        System.out.println("Dequeued: " + result);
        return result;
    }

    public static int getFront() {
        if (size == 0) return -1;
        return arr[front];
    }

    public static int getRear() {
        if (size == 0) return -1;
        int rear = (front + size - 1) % capacity;
        return arr[rear];
    }

    public static void main(String[] args) {
        initQueue(4);

        enqueue(10);
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());

        enqueue(20);
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());

        enqueue(30);
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());

        enqueue(40);
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());

        dequeue();
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());

        dequeue();
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());

        enqueue(50);
        System.out.println("Front: " + getFront() + ", Rear: " + getRear());
    }
}
