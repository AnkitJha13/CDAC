#include <iostream>
using namespace std;

const int SIZE = 10;

void inputMatrix(int mat[SIZE][SIZE], int row, int col) {
    cout << "Enter matrix elements:\n";
    for (int i = 0; i < row; i++)
        for (int j = 0; j < col; j++)
            cin >> mat[i][j];
}

void displayMatrix(int mat[SIZE][SIZE], int row, int col) {
    cout << "Matrix:\n";
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++)
            cout << mat[i][j] << " ";
        cout << endl;
    }
}

void addMatrices(int A[SIZE][SIZE], int B[SIZE][SIZE], int row, int col) {
    int result[SIZE][SIZE];
    for (int i = 0; i < row; i++)
        for (int j = 0; j < col; j++)
            result[i][j] = A[i][j] + B[i][j];

    cout << "Addition Result:\n";
    displayMatrix(result, row, col);
}

void multiplyMatrices(int A[SIZE][SIZE], int B[SIZE][SIZE], int r1, int c1, int c2) {
    int result[SIZE][SIZE] = {0};
    for (int i = 0; i < r1; i++)
        for (int j = 0; j < c2; j++)
            for (int k = 0; k < c1; k++)
                result[i][j] += A[i][k] * B[k][j];

    cout << "Multiplication Result:\n";
    displayMatrix(result, r1, c2);
}

void transposeMatrix(int mat[SIZE][SIZE], int row, int col) {
    int trans[SIZE][SIZE];
    for (int i = 0; i < row; i++)
        for (int j = 0; j < col; j++)
            trans[j][i] = mat[i][j];

    cout << "Transpose:\n";
    displayMatrix(trans, col, row);
}

int main() {
    int choice;
    int A[SIZE][SIZE], B[SIZE][SIZE];
    int r1, c1, r2, c2;

    do {
        cout << "\n--- Matrix Operations Menu ---\n";
        cout << "1. Matrix Addition\n";
        cout << "2. Matrix Multiplication\n";
        cout << "3. Matrix Transpose\n";
        cout << "4. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
                cout << "Enter rows and columns: ";
                cin >> r1 >> c1;
                cout << "Matrix A:\n";
                inputMatrix(A, r1, c1);
                cout << "Matrix B:\n";
                inputMatrix(B, r1, c1);
                addMatrices(A, B, r1, c1);
                break;

            case 2:
                cout << "Enter rows and columns of Matrix A: ";
                cin >> r1 >> c1;
                cout << "Enter columns of Matrix B: ";
                cin >> c2;
                r2 = c1; // valid multiplication
                cout << "Matrix A:\n";
                inputMatrix(A, r1, c1);
                cout << "Matrix B:\n";
                inputMatrix(B, r2, c2);
                multiplyMatrices(A, B, r1, c1, c2);
                break;

            case 3:
                cout << "Enter rows and columns: ";
                cin >> r1 >> c1;
                inputMatrix(A, r1, c1);
                transposeMatrix(A, r1, c1);
                break;

            case 4:
                cout << "Exiting program.\n";
                break;

            default:
                cout << "Invalid choice.\n";
        }

    } while (choice != 4);

    return 0;
}
