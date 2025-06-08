#include <iostream>
using namespace std;

int power(int base, int exponent) {
    int result = 1;
    for (int i = 1; i <= exponent; i++)
        result *= base;
    return result;
}

int main() {
    int base, exp;
    cout << "Enter base and exponent: ";
    cin >> base >> exp;

    cout << base << "^" << exp << " = " << power(base, exp) << endl;

    return 0;
}
