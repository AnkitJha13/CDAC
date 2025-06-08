#include <iostream>
using namespace std;

class Engine {
public:
    Engine() {
        cout << "Engine initialized" << endl;
    }
};

class Vehicle {
public:
    Vehicle() {
        cout << "Vehicle initialized" << endl;
    }
};

class Car : public Engine, public Vehicle {
public:
    Car() {
        cout << "Car initialized" << endl;
    }
};

int main() {
    Car myCar;
    return 0;
}
