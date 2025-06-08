#include <iostream>
using namespace std;

class Integer {
    int value;

public:
    // Constructor
    Integer(int v = 0) {
        value = v;
    }

    // Overload ==
    bool operator==(const Integer& other) const {
        return value == other.value;
    }

    // Overload !=
    bool operator!=(const Integer& other) const {
        return value != other.value;
    }

    // Overload <
    bool operator<(const Integer& other) const {
        return value < other.value;
    }

    // Overload >
    bool operator>(const Integer& other) const {
        return value > other.value;
    }
};

int main() {
    Integer num1(10), num2(20);

    if (num1 < num2) {
        cout << "num1 is smaller than num2" << endl;
    }

    if (num1 == num2) {
        cout << "num1 is equal to num2" << endl;
    } else {
        cout << "num1 is not equal to num2" << endl;
    }

    if (num1 > num2) {
        cout << "num1 is greater than num2" << endl;
    }

    return 0;
}
