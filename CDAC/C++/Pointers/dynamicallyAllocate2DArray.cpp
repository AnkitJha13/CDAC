#include <iostream>
using namespace std;

// Function to allocate memory for 2D array
void allocate2DArray(int*** arr, int rows, int cols) {
    *arr = new int*[rows]; // allocate array of row pointers
    for (int i = 0; i < rows; i++) {
        (*arr)[i] = new int[cols]; // allocate each row
    }
}

// Function to input the array
void input2DArray(int** arr, int rows, int cols) {
    cout << "Enter elements of the array:\n";
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            cin >> arr[i][j];
}

// Function to print the array
void print2DArray(int** arr, int rows, int cols) {
    cout << "2D Array:\n";
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++)
            cout << arr[i][j] << " ";
        cout << endl;
    }
}

// Function to free memory
void deallocate2DArray(int** arr, int rows) {
    for (int i = 0; i < rows; i++)
        delete[] arr[i];
    delete[] arr;
}

int main() {
    int** array;
    int rows, cols;

    cout << "Enter number of rows and columns: ";
    cin >> rows >> cols;

    allocate2DArray(&array, rows, cols);  // allocate memory
    input2DArray(array, rows, cols);      // fill data
    print2DArray(array, rows, cols);      // display data
    deallocate2DArray(array, rows);       // clean up

    return 0;
}
