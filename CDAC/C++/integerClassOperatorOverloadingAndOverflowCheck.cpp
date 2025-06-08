#include <bits/stdc++.h>
using namespace std;

class Integer {
    int value;

public:
    // Constructor
    Integer(int val = 0) {
        value = val;
    }

    // Getter for value
    int getValue() const {
        return value;
    }

    // Overload + for Integer + Integer
    Integer operator+(const Integer& other) const {
        if ((other.value > 0) && (value > INT_MAX - other.value)) {
            cout << "Overflow in addition!" << endl;
            return Integer(INT_MAX);
        } else if ((other.value < 0) && (value < INT_MIN - other.value)) {
            cout << "Underflow in addition!" << endl;
            return Integer(INT_MIN);
        }
        return Integer(value + other.value);
    }

    // Overload + for Integer + int
    Integer operator+(int num) const {
        if ((num > 0) && (value > INT_MAX - num)) {
            cout << "Overflow in addition!" << endl;
            return Integer(INT_MAX);
        } else if ((num < 0) && (value < INT_MIN - num)) {
            cout << "Underflow in addition!" << endl;
            return Integer(INT_MIN);
        }
        return Integer(value + num);
    }

    // Overload * for int * Integer (friend function)
    friend Integer operator*(int lhs, const Integer& rhs) {
        if (rhs.value != 0 && (lhs > INT_MAX / rhs.value || lhs < INT_MIN / rhs.value)) {
            cout << "Overflow in multiplication!" << endl;
            return Integer(INT_MAX);
        }
        return Integer(lhs * rhs.value);
    }

    // Function to display value
    void display() const {
        cout << value << endl;
    }
};

// Test usage
int main() {
    Integer num1(10), num2(5);

    Integer resOne = num1 + num2;   // 10 + 5 = 15
    Integer resTwo = num1 + 20;     // 10 + 20 = 30
    Integer resThree = 10 * num2;   // 10 * 5 = 50

    cout << "Result One: ";
    resOne.display();

    cout << "Result Two: ";
    resTwo.display();

    cout << "Result Three: ";
    resThree.display();

    return 0;
}
