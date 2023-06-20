//Generate a neighborhood around x0 for a given  δ .

#include <iostream>

using namespace std;

void Neighborhood(double x0, double delta) {
    double lowerBound = x0 - delta;
    double upperBound = x0 + delta;

    cout << "Neighborhood is : [" << lowerBound << ", " << upperBound << "]" << endl;
}

int main() {
    double x0, delta;
    cout << "Enter the value of x0: ";
    cin >> x0;
    cout << "Enter the value of delta: ";
    cin >> delta;

    Neighborhood(x0, delta);

    return 0;
}

//Md. Farhan Tahsin Rifty
