#include <iostream>
using namespace std;

int findPrimeFactors(int num, int factors[]) {
    int index = 0;
    for (int i = 2; i <= num; i++) {
        while (num % i == 0) {
            factors[index++] = i;
            num /= i;
        }
    }
    return index;
}

int main() {
    int num;
    int factors[100]; // max limit
    cout << "Enter a number: ";
    cin >> num;

    int count = findPrimeFactors(num, factors);

    cout << "Prime Factors of " << num << ": ";
    for (int i = 0; i < count; i++)
        cout << factors[i] << " ";
    cout << endl;

    return 0;
}
