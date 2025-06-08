#include <iostream>
using namespace std;

int main() {
    int arr[5];
    int* ptr = arr;  // pointer to the array
    int sum = 0;

    cout << "Enter 5 numbers:\n";
    for (int i = 0; i < 5; i++) {
        cin >> *(ptr + i);  // input using pointer arithmetic
    }

    for (int i = 0; i < 5; i++) {
        sum += *(ptr + i);  // sum elements using pointer arithmetic
    }

    float average = (float)sum / 5;
    cout << "Average = " << average << endl;

    return 0;
}
