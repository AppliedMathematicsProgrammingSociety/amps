//Find the Supremum and Infimum of a Set.

#include <iostream>
#include <set>

using namespace std;

int main() {
    std::set<double> setS;

    int n;
    char s;

    cout << "Enter the number of elements in the set: ";
    cin >> n;

    cout << "Enter the type of set (O for open, C for closed): ";
    cin >> s;

    for (int i = 0; i < n; ++i) {
        double element;
        cout << "Element " << (i + 1) << ": ";
        cin >> element;
        setS.insert(element);
    }

    double sup = *setS.begin();
    double inf = *setS.begin();

    for (const double& element : setS) {
        if (element > sup) {
            sup = element;
        }
        if (element < inf) {
            inf = element;
        }
    }

    if (s == 'O') {
        setS.erase(sup);
        setS.erase(inf);
    }

    cout << "Least Upper Bound (Supremum): " << sup << std::endl;
    cout << "Greatest Lower Bound (Infimum): " << inf << std::endl;

    return 0;
}

//Md. Farhan Tahsin Rifty
