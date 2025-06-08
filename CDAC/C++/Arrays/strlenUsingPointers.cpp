#include <iostream>
using namespace std;

int myStrlen(const char* str) {
    const char* ptr = str;
    while (*ptr != '\0') {
        ptr++;
    }
    return ptr - str;
}

int main() {
    char str[100];
    cout << "Enter a string: ";
    cin.getline(str, 100);

    int length = myStrlen(str);
    cout << "Length of the string: " << length << endl;

    return 0;
}
