public class HashTableDoubleHashing {
    private int[] table;
    private int size;

    public HashTableDoubleHashing(int size) {
        this.size = size;
        table = new int[size];
        for (int i = 0; i < size; i++) {
            table[i] = -1;
        }
    }

    private int hash1(int key) {
        return key % size;
    }


    private int hash2(int key) {

        int prime = previousPrime(size);
        return prime - (key % prime);
    }

    // Utility to find largest prime smaller than n
    private int previousPrime(int n) {
        for (int i = n - 1; i >= 2; i--) {
            if (isPrime(i)) return i;
        }
        return 3; // fallback
    }

    private boolean isPrime(int num) {
        if (num <= 1) return false;
        for (int i = 2; i * i <= num; i++) {
            if (num % i == 0) return false;
        }
        return true;
    }

    public void insert(int key) {
        int index = hash1(key);
        int step = hash2(key);

        int i = 0;
        while (table[(index + i * step) % size] != -1) {
            i++;
            if (i == size) {
                System.out.println("Hash table is full, cannot insert key: " + key);
                return;
            }
        }
        table[(index + i * step) % size] = key;
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
        int tableSize = 11;  // Preferably a prime number

        HashTableDoubleHashing hashTable = new HashTableDoubleHashing(tableSize);

        for (int key : keys) {
            hashTable.insert(key);
        }

        hashTable.printTable();
    }
}
