#include <iostream>
using namespace std;

const int SIZE = 100;

int main() {
    int arr[SIZE];
    int n;

    cout << "Enter number of elements in array: ";
    cin >> n;

    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    int choice;

    do {
        cout << "\n--- Menu ---\n";
        cout << "1. Add Element\n";
        cout << "2. Display Elements\n";
        cout << "3. Delete Element\n";
        cout << "4. Sort Elements\n";
        cout << "5. Search Element\n";
        cout << "6. Find Average\n";
        cout << "7. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1: {
                if (n < SIZE) {
                    int newElem;
                    cout << "Enter element to add: ";
                    cin >> newElem;
                    arr[n++] = newElem;
                    cout << "Element added.";
                } else {
                    cout << "Array is full!";
                }
                break;
            }

            case 2: {
                if (n == 0) {
                    cout << "Array is empty!";
                } else {
                    cout << "Array elements: ";
                    for (int i = 0; i < n; i++) {
                        cout << arr[i] << " ";
                    }
                }
                break;
            }

            case 3: {
                int delElem, found = 0;
                cout << "Enter element to delete: ";
                cin >> delElem;
                for (int i = 0; i < n; i++) {
                    if (arr[i] == delElem) {
                        for (int j = i; j < n - 1; j++) {
                            arr[j] = arr[j + 1];
                        }
                        n--;
                        found = 1;
                        cout << "Element deleted.";
                        break;
                    }
                }
                if (!found) {
                    cout << "Element not found.";
                }
                break;
            }

            case 4: {
                for (int i = 0; i < n - 1; i++) {
                    for (int j = 0; j < n - i - 1; j++) {
                        if (arr[j] > arr[j + 1]) {
                            int temp = arr[j];
                            arr[j] = arr[j + 1];
                            arr[j + 1] = temp;
                        }
                    }
                }
                cout << "Array sorted.";
                break;
            }

            case 5: {
                int searchElem, found = 0;
                cout << "Enter element to search: ";
                cin >> searchElem;
                for (int i = 0; i < n; i++) {
                    if (arr[i] == searchElem) {
                        cout << "Element found at position " << i + 1;
                        found = 1;
                        break;
                    }
                }
                if (!found) {
                    cout << "Element not found.";
                }
                break;
            }

            case 6: {
                if (n == 0) {
                    cout << "Array is empty!";
                } else {
                    int sum = 0;
                    for (int i = 0; i < n; i++) {
                        sum += arr[i];
                    }
                    cout << "Average = " << (float)sum / n;
                }
                break;
            }

            case 7:
                cout << "Exiting program.";
                break;

            default:
                cout << "Invalid choice!";
        }

    } while (choice != 7);

    return 0;
}
