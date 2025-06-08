#include <iostream>
using namespace std;

int main() {
    int arr[5] = {10, 20, 30, 40, 50};  // example array
    int* ptr = arr;  // pointer to the first element

    // Access 3rd element (index 2) and 5th element (index 4) using pointer arithmetic
    cout << "3rd element: " << *(ptr + 2) << endl;
    cout << "5th element: " << *(ptr + 4) << endl;

    return 0;
}
