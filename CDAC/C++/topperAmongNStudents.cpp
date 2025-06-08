#include <iostream>
using namespace std;

const int SUBJECTS = 5;

int main() {
    int n;
    cout << "Enter number of students in the class: ";
    cin >> n;

    int marks[n][SUBJECTS];
    int total[n];

    // Input marks for each student
    for (int i = 0; i < n; i++) {
        cout << "\nEnter marks of 5 subjects for Student " << i + 1 << ":\n";
        total[i] = 0;
        for (int j = 0; j < SUBJECTS; j++) {
            cout << "Subject " << j + 1 << ": ";
            cin >> marks[i][j];
            total[i] += marks[i][j];
        }
    }

    // Find topper
    int topperIndex = 0;
    for (int i = 1; i < n; i++) {
        if (total[i] > total[topperIndex]) {
            topperIndex = i;
        }
    }

    // Display topper details
    cout << "\nTopper is Student " << topperIndex + 1 << " with total marks = " << total[topperIndex] << endl;
    cout << "Marks in 5 subjects: ";
    for (int j = 0; j < SUBJECTS; j++) {
        cout << marks[topperIndex][j] << " ";
    }
    cout << endl;

    return 0;
}
