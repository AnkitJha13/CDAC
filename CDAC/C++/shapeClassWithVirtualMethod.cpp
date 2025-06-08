#include <iostream>
using namespace std;

class Shape {
public:
    virtual double area() {
        return 0;
    }
};

class Circle : public Shape {
    double radius;
public:
    Circle(double r) {
        radius = r;
    }
    double area() {
        return 3.14159 * radius * radius;
    }
};

class Rectangle : public Shape {
    double length, breadth;
public:
    Rectangle(double l, double b) {
        length = l;
        breadth = b;
    }
    double area() {
        return length * breadth;
    }
};

int main() {
    Shape* shapes[2];
    shapes[0] = new Circle(5);      // Circle with radius 5
    shapes[1] = new Rectangle(4, 6); // Rectangle with length 4 and breadth 6

    for (int i = 0; i < 2; i++) {
        cout << "Area of shape " << (i + 1) << " is " << shapes[i]->area() << endl;
    }

    // Free allocated memory
    delete shapes[0];
    delete shapes[1];

    return 0;
}
