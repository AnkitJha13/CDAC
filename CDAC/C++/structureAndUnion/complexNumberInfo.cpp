#include <iostream>
using namespace std;

struct Complex {
    float real;
    float imag;
};

// Function to add two complex numbers
Complex add(Complex a, Complex b) {
    Complex result;
    result.real = a.real + b.real;
    result.imag = a.imag + b.imag;
    return result;
}

// Function to subtract two complex numbers
Complex subtract(Complex a, Complex b) {
    Complex result;
    result.real = a.real - b.real;
    result.imag = a.imag - b.imag;
    return result;
}

// Function to multiply two complex numbers
Complex multiply(Complex a, Complex b) {
    Complex result;
    result.real = (a.real * b.real) - (a.imag * b.imag);
    result.imag = (a.real * b.imag) + (a.imag * b.real);
    return result;
}

// Function to display a complex number
void display(Complex c) {
    cout << c.real;
    if (c.imag >= 0)
        cout << " + " << c.imag << "i";
    else
        cout << " - " << -c.imag << "i";
    cout << endl;
}

int main() {
    Complex num1, num2, sum, diff, prod;

    cout << "Enter real and imaginary part of first complex number: ";
    cin >> num1.real >> num1.imag;

    cout << "Enter real and imaginary part of second complex number: ";
    cin >> num2.real >> num2.imag;

    sum = add(num1, num2);
    diff = subtract(num1, num2);
    prod = multiply(num1, num2);

    cout << "\nSum: ";
    display(sum);

    cout << "Difference: ";
    display(diff);

    cout << "Product: ";
    display(prod);

    return 0;
}
