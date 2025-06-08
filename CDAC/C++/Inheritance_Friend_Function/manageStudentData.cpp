#include <iostream>
using namespace std;

class Student {
private:
    string prn, course, batch, email;
    int marks[5];
    float percent;
    char grade;

public:
    void inputData() {
        cout << "Enter PRN: ";
        cin >> prn;
        cout << "Enter Course: ";
        cin >> course;
        cout << "Enter Batch: ";
        cin >> batch;
        cout << "Enter Email ID: ";
        cin >> email;
        cout << "Enter marks in 5 subjects:\n";
        for (int i = 0; i < 5; i++) {
            cout << "Subject " << (i + 1) << ": ";
            cin >> marks[i];
        }
        calculatePercent();
        calculateGrade();
    }

    void calculatePercent() {
        int total = 0;
        for (int i = 0; i < 5; i++) {
            total += marks[i];
        }
        percent = total / 5.0f;
    }

    void calculateGrade() {
        if (percent >= 90) grade = 'A';
        else if (percent >= 75) grade = 'B';
        else if (percent >= 60) grade = 'C';
        else if (percent >= 50) grade = 'D';
        else grade = 'F';
    }

    // Friend function declaration
    friend void displayPRNandGrade(Student students[], int n);
};

// Friend function definition
void displayPRNandGrade(Student students[], int n) {
    cout << "\n--- PRN and Grade of Students ---\n";
    for (int i = 0; i < n; i++) {
        cout << "PRN: " << students[i].prn
             << ", Grade: " << students[i].grade << endl;
    }
}

int main() {
    int n;
    cout << "Enter number of students: ";
    cin >> n;

    Student students[n];
    for (int i = 0; i < n; i++) {
        cout << "\nEnter details for student " << i + 1 << ":\n";
        students[i].inputData();
    }

    // Call friend function
    displayPRNandGrade(students, n);

    return 0;
}
