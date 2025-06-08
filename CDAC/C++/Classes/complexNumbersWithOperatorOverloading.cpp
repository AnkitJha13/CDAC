#include <iostream>
using namespace std;

class Complex {
private:
    float real;
    float imag;

public:
    // Default constructor
    Complex() {
        real = 0;
        imag = 0;
    }

    // Parameterized constructor
    Complex(float r, float i) {
        real = r;
        imag = i;
    }

    // Display function
    void display() {
        cout << real << " + " << imag << "i" << endl;
    }

    // Operator overloading for addition
    Complex operator + (Complex c) {
        return Complex(real + c.real, imag + c.imag);
    }

    // Operator overloading for subtraction
    Complex operator - (Complex c) {
        return Complex(real - c.real, imag - c.imag);
    }

    // Operator overloading for multiplication
    Complex operator * (Complex c) {
        float r = real * c.real - imag * c.imag;
        float i = real * c.imag + imag * c.real;
        return Complex(r, i);
    }
};

int main() {
    float r1, i1, r2, i2;

    cout << "Enter real and imaginary part of first complex number: ";
    cin >> r1 >> i1;

    cout << "Enter real and imaginary part of second complex number: ";
    cin >> r2 >> i2;

    Complex c1(r1, i1);      // uses parameterized constructor
    Complex c2(r2, i2);      // uses parameterized constructor

    Complex sum = c1 + c2;   // operator+ overload
    Complex diff = c1 - c2;  // operator- overload
    Complex prod = c1 * c2;  // operator* overload

    cout << "\nFirst Complex Number: ";
    c1.display();

    cout << "Second Complex Number: ";
    c2.display();

    cout << "\nSum: ";
    sum.display();

    cout << "Difference: ";
    diff.display();

    cout << "Product: ";
    prod.display();

    return 0;
}
