#include <bits/stdc++.h>
using namespace std;

const int SIZE = 10;

class Student {
public:
    int rollNo;
    string name;
    int day, month, year; // Date of Birth
    int totalMarks;

    void input() {
        cout << "Enter Roll Number: ";
        cin >> rollNo;
        cin.ignore(); // flush newline
        cout << "Enter Name: ";
        getline(cin, name);
        cout << "Enter Date of Birth (DD MM YYYY): ";
        cin >> day >> month >> year;
        cout << "Enter Total Marks: ";
        cin >> totalMarks;
    }

    void display() {
        cout << "Roll No: " << rollNo
             << ", Name: " << name
             << ", DOB: " << day << "/" << month << "/" << year
             << ", Total Marks: " << totalMarks << endl;
    }
};

// Sort by Roll Number
bool compareByRoll(const Student &a, const Student &b) {
    return a.rollNo < b.rollNo;
}

// Sort by DOB
bool compareByDOB(const Student &a, const Student &b) {
    if (a.year != b.year)
        return a.year < b.year;
    else if (a.month != b.month)
        return a.month < b.month;
    else
        return a.day < b.day;
}

// Sort by Total Marks
bool compareByMarks(const Student &a, const Student &b) {
    return a.totalMarks > b.totalMarks;
}

int main() {
    Student students[SIZE];

    cout << "Enter details of " << SIZE << " students:\n";
    for (int i = 0; i < SIZE; ++i) {
        cout << "\nStudent " << i + 1 << ":\n";
        students[i].input();
    }

    cout << "\n--- Students Sorted by Roll Number ---\n";
    sort(students, students + SIZE, compareByRoll);
    for (int i = 0; i < SIZE; ++i) {
        students[i].display();
    }

    cout << "\n--- Students Sorted by Date of Birth ---\n";
    sort(students, students + SIZE, compareByDOB);
    for (int i = 0; i < SIZE; ++i) {
        students[i].display();
    }

    cout << "\n--- Students Sorted by Total Marks ---\n";
    sort(students, students + SIZE, compareByMarks);
    for (int i = 0; i < SIZE; ++i) {
        students[i].display();
    }

    return 0;
}
