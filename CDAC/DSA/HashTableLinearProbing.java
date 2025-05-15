public class HashTableLinearProbing {
    private int[] table;
    private int size;

    public HashTableLinearProbing(int size) {
        this.size = size;
        table = new int[size];

        for (int i = 0; i < size; i++) {
            table[i] = -1;
        }
    }


    private int hash(int key) {
        return key % size;
    }


    public void insert(int key) {
        int index = hash(key);
        int startIndex = index;


        while (table[index] != -1) {
            index = (index + 1) % size;
            if (index == startIndex) {
                System.out.println("Hash table is full, cannot insert key: " + key);
                return;
            }
        }

        table[index] = key;
    }


    public void printTable() {
        System.out.println("Final hash table:");
        for (int i = 0; i < size; i++) {
            if (table[i] != -1) {
                System.out.println("Index " + i + " : " + table[i]);
            } else {
                System.out.println("Index " + i + " : " + "empty");
            }
        }
    }


    public static void main(String[] args) {
        int[] keys = {10, 22, 31, 4, 15, 28, 17, 88, 59};
        int tableSize = 10;

        HashTableLinearProbing hashTable = new HashTableLinearProbing(tableSize);

        for (int key : keys) {
            hashTable.insert(key);
        }

        hashTable.printTable();
    }
}
