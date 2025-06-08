#include <iostream>
#include <string>
using namespace std;

class Student {
    string name;
    int roll;

public:
    Student() {
        name = "Unknown";
        roll = -1;
    }

    void setData(string n, int r) {
        name = n;
        roll = r;
    }

    void display() const {
        cout << "Name: " << name << ", Roll: " << roll << endl;
    }
};

// Function to initialize array of pointers
void initializeStudents(Student* arr[], int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = new Student();  // allocate memory
        string name;
        int roll;
        cout << "Enter name and roll number for student " << i + 1 << ": ";
        cin >> name >> roll;
        arr[i]->setData(name, roll);
    }
}

// Function to modify a student's data
void modifyStudent(Student* arr[], int index) {
    string name;
    int roll;
    cout << "Enter new name and roll number: ";
    cin >> name >> roll;
    arr[index]->setData(name, roll);
}

// Function to display all students
void displayAll(Student* arr[], int size) {
    for (int i = 0; i < size; i++) {
        cout << "Student " << i + 1 << ": ";
        arr[i]->display();
    }
}

// Function to delete the objects
void deleteStudents(Student* arr[], int size) {
    for (int i = 0; i < size; i++) {
        delete arr[i];  // free memory
    }
}

int main() {
    const int SIZE = 3;
    Student* students[SIZE];

    initializeStudents(students, SIZE);
    cout << "\n--- Student Data ---\n";
    displayAll(students, SIZE);

    cout << "\nModify 2nd student:\n";
    modifyStudent(students, 1);  // modify 2nd student (index 1)
    
    cout << "\n--- Updated Data ---\n";
    displayAll(students, SIZE);

    deleteStudents(students, SIZE);  // clean up memory
    return 0;
}
