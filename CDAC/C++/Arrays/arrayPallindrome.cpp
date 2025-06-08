#include <iostream>
using namespace std;

bool isPalindrome(int arr[], int n) {
    int* start = arr;
    int* end = arr + n - 1;

    while (start < end) {
        if (*start != *end)
            return false;
        start++;
        end--;
    }
    return true;
}

int main() {
    int arr[100], n;
    cout << "Enter size of array: ";
    cin >> n;
    cout << "Enter array elements:\n";
    for (int i = 0; i < n; i++)
        cin >> arr[i];

    if (isPalindrome(arr, n))
        cout << "The array is a palindrome.\n";
    else
        cout << "The array is not a palindrome.\n";

    return 0;
}
