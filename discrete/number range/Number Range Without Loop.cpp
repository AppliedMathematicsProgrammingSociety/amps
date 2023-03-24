//206(2)_5
//Print all numbers in a range without using loops.

#include <iostream>
using namespace std;

void Range(int a, int b) {
    if (a <= b) {
        cout << a << " ";
        Range(a + 1, b);
    }
}

int main() {
    int a, b;
    cout << "Enter the starting number: ";
    cin >> a;
    cout << "Enter the ending number: ";
    cin >> b;
    Range(a, b);
    return 0;
}

//Md. Farhan Tahsin Rifty