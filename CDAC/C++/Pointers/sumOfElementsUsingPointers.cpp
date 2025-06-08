#include <iostream>
using namespace std;

int SumOfElements(int* arr, int size) {
    int sum = 0;
    for (int i = 0; i < size; ++i) {
        sum += arr[i];  // or *(arr + i)
    }
    return sum;
}

int main() {
    int numbers[] = {5, 10, 15, 20, 25};
    int size = sizeof(numbers) / sizeof(numbers[0]);

    int total = SumOfElements(numbers, size);

    cout << "Sum of elements: " << total << endl;

    return 0;
}
