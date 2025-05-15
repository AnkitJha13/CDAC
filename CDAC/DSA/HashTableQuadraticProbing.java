public class HashTableQuadraticProbing {
    private int[] table;
    private int size;

    public HashTableQuadraticProbing(int size) {
        this.size = size;
        table = new int[size];
        for (int i = 0; i < size; i++) {
            table[i] = -1;  // -1 indicates empty slot
        }
    }

    private int hash(int key) {
        return key % size;
    }

    public void insert(int key) {
        int index = hash(key);
        int i = 0;

        // Quadratic probing: index = (hash + i^2) % size
        while (table[(index + i * i) % size] != -1) {
            i++;
            if (i == size) {  // table full
                System.out.println("Hash table is full, cannot insert key: " + key);
                return;
            }
        }

        table[(index + i * i) % size] = key;
    }

    public void printTable() {
        System.out.println("Final hash table:");
        for (int i = 0; i < size; i++) {
            if (table[i] != -1) {
                System.out.println("Index " + i + " : " + table[i]);
            } else {
                System.out.println("Index " + i + " : empty");
            }
        }
    }

    public static void main(String[] args) {
        int[] keys = {10, 22, 31, 4, 15, 28, 17, 88, 59};
        int tableSize = 10;

        HashTableQuadraticProbing hashTable = new HashTableQuadraticProbing(tableSize);

        for (int key : keys) {
            hashTable.insert(key);
        }

        hashTable.printTable();
    }
}
