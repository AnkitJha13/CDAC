#include <iostream>
using namespace std;

struct Student {
    int id;
    char name[50];
    int age;
    float marks;
};

int main() {
    Student s;

    // Input student information
    cout << "Enter student ID: ";
    cin >> s.id;
    cin.ignore();  // to clear the newline from input buffer before getline
    cout << "Enter student name: ";
    cin.getline(s.name, 50);
    cout << "Enter student age: ";
    cin >> s.age;
    cout << "Enter student marks: ";
    cin >> s.marks;

    // Display student information
    cout << "\nStudent Information:\n";
    cout << "ID: " << s.id << endl;
    cout << "Name: " << s.name << endl;
    cout << "Age: " << s.age << endl;
    cout << "Marks: " << s.marks << endl;

    return 0;
}
