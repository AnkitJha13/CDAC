#include <iostream>
using namespace std;

class Box {
    double volume;

public:
    Box(double vol) {
        volume = vol;
    }

    bool operator>(const Box& other) {
        return volume > other.volume;
    }

    void display() {
        cout << "Volume: " << volume << endl;
    }
};

int main() {
    
    Box* box1 = new Box(8 * 1 * 5);  
    Box* box2 = new Box(4 * 9 * 6);  

    cout << "Box1 ";
    box1->display();
    cout << "Box2 ";
    box2->display();

    
    if (*box1 > *box2) {
        cout << "Box1 is greater than Box2" << endl;
    } else {
        cout << "Box2 is greater than or equal to Box1" << endl;
    }

    delete box1;
    delete box2;

    return 0;
}
