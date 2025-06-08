#include <iostream>
using namespace std;

// Base class
class Person {
protected:
    string name;
    int age;

public:
    void getPersonData() {
        cout << "Enter name: ";
        getline(cin, name);
        cout << "Enter age: ";
        cin >> age;
        cin.ignore(); // To handle leftover newline
    }

    void displayPersonData() {
        cout << "Name: " << name << endl;
        cout << "Age: " << age << endl;
    }
};

// Derived class from Person
class Employee : public Person {
protected:
    int empID;
    float salary;

public:
    void getEmployeeData() {
        getPersonData(); // Call base class method
        cout << "Enter employee ID: ";
        cin >> empID;
        cout << "Enter salary: ";
        cin >> salary;
        cin.ignore();
    }

    void displayEmployeeData() {
        displayPersonData();
        cout << "Employee ID: " << empID << endl;
        cout << "Salary: " << salary << endl;
    }
};

// Derived class from Employee
class Manager : public Employee {
private:
    string department;

public:
    void getManagerData() {
        getEmployeeData(); // Call parent method
        cout << "Enter department: ";
        getline(cin, department);
    }

    void displayManagerData() {
        displayEmployeeData();
        cout << "Department: " << department << endl;
    }
};

int main() {
    Manager m;
    
    cout << "--- Enter Manager Information ---\n";
    m.getManagerData();

    cout << "\n--- Manager Details ---\n";
    m.displayManagerData();

    return 0;
}
