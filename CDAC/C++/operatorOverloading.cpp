#include <iostream>
using namespace std;

class Integer {
public:
    int data;

    // Constructor
    Integer(int data) {
        this->data = data;
    }

    // Overload + operator for Integer + Integer
    Integer operator+(Integer obj) {
        return Integer(data + obj.data);
    }

    // Overload - operator for Integer - Integer
    Integer operator-(Integer obj) {
        return Integer(data - obj.data);
    }

    // Overload * operator for Integer * Integer
    Integer operator*(Integer obj) {
        return Integer(data * obj.data);
    }

    // Overload + operator for Integer + int
    Integer operator+(int num) {
        return Integer(data + num);
    }

    // Friend function for int + Integer
    friend Integer operator+(int num, Integer obj) {
        return Integer(num + obj.data);
    }

    // Friend function for int * Integer
    friend Integer operator*(int num, Integer obj) {
        return Integer(num * obj.data);
    }

    // Overload != operator
    bool operator!=(Integer obj) {
        return data != obj.data;
    }

    // Overload > operator
    bool operator>(Integer obj) {
        return data > obj.data;
    }

    // Overload < operator
    bool operator<(Integer obj) {
        return data < obj.data;
    }

    // Overload == operator
    bool operator==(Integer obj) {
        return data == obj.data;
    }
};

int main() {
    Integer num1(10), num2(5);

    // Integer + Integer
    Integer resOne = num1 + num2;       // 10 + 5 = 15

    // Integer + int
    Integer resTwo = num1 + 20;         // 10 + 20 = 30

    // int * Integer
    Integer resThree = 10 * num2;       // 10 * 5 = 50

    cout << "Result One   : " << resOne.data << endl;
    cout << "Result Two   : " << resTwo.data << endl;
    cout << "Result Three : " << resThree.data << endl;

    // Comparison outputs
    if (num1 < num2) {
        cout << "num1 is smaller than num2" << endl;
    }
    if (num1 == num2) {
        cout << "num1 is equal to num2" << endl;
    }
    if (num1 > num2) {
        cout << "num2 is smaller than num1" << endl;
    }

    return 0;
}