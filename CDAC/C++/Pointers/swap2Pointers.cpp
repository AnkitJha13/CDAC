#include <iostream>
using namespace std;

void swapPointers(int*& ptr1, int*& ptr2) {
    int* temp = ptr1;
    ptr1 = ptr2;
    ptr2 = temp;
}

int main() {
    int a = 10, b = 20;
    int* p1 = &a;
    int* p2 = &b;

    cout << "Before swap:\n";
    cout << "p1 points to value: " << *p1 << endl;  // 10
    cout << "p2 points to value: " << *p2 << endl;  // 20

    swapPointers(p1, p2);

    cout << "After swap:\n";
    cout << "p1 points to value: " << *p1 << endl;  // 20
    cout << "p2 points to value: " << *p2 << endl;  // 10

    return 0;
}
