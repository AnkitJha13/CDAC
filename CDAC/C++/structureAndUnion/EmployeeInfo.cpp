#include <iostream>
#include <string>
using namespace std;

struct Employee {
    int id;
    string name;
    string department;
    float salary;
};

// Function to calculate average salary
float averageSalary(Employee emp[], int n) {
    float sum = 0;
    for (int i = 0; i < n; i++) {
        sum += emp[i].salary;
    }
    return sum / n;
}

// Function to calculate department-wise average salary
void departmentAverage(Employee emp[], int n) {
    string dept1, dept2;
    int count1 = 0, count2 = 0;
    float total1 = 0, total2 = 0;

    dept1 = emp[0].department; // assume first department

    for (int i = 0; i < n; i++) {
        if (emp[i].department == dept1) {
            total1 += emp[i].salary;
            count1++;
        } else {
            dept2 = emp[i].department;
            total2 += emp[i].salary;
            count2++;
        }
    }

    if (count1 > 0)
        cout << "Average salary of " << dept1 << ": " << total1 / count1 << endl;
    if (count2 > 0)
        cout << "Average salary of " << dept2 << ": " << total2 / count2 << endl;
}

int main() {
    Employee emp[10];

    // Taking input
    for (int i = 0; i < 10; i++) {
        cout << "\nEnter details for Employee " << i + 1 << ":\n";
        cout << "ID: ";
        cin >> emp[i].id;
        cin.ignore();
        cout << "Name: ";
        getline(cin, emp[i].name);
        cout << "Department: ";
        getline(cin, emp[i].department);
        cout << "Salary: ";
        cin >> emp[i].salary;
    }

    // Overall average salary
    float avg = averageSalary(emp, 10);
    cout << "\nOverall Average Salary: " << avg << endl;

    // Department-wise average salary
    departmentAverage(emp, 10);

    return 0;
}
