#include <iostream>
using namespace std;

int main() {
    int num = 25;           // declare and initialize an integer variable
    int* ptr = &num;        // declare pointer and store address of num

    cout << "Value of num: " << num << endl;
    cout << "Address of num: " << &num << endl;
    cout << "Value stored in pointer (address): " << ptr << endl;
    cout << "Value pointed to by pointer: " << *ptr << endl;

    return 0;
}
