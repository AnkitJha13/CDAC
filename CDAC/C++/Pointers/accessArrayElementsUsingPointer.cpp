#include <iostream>
using namespace std;

int main() {
    int arr[5] = {10, 20, 30, 40, 50};
    int* ptr = arr;  // Pointer pointing to the first element of the array

    cout << "Array elements accessed using pointer:\n";
    for (int i = 0; i < 5; i++) {
        cout << *(ptr + i) << " ";  // Access element using pointer arithmetic
    }
    cout << endl;

    return 0;
}
