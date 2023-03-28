//205_1.1_1
//Show that the following equation has at least one solution in the given interval.


#include <iostream>
#include <cmath>
using namespace std;

int main() 
{
    int n;
    double p, q;
    cout << "Enter the degree of the polynomial: ";
    cin >> n;
    double coefficient[n+1];
    for (int i = 0; i <= n; i++) 
    {
        cout << "Enter the coefficient of x^" << i << ": ";
        cin >> coefficient[i];
    }
    cout << "Enter the interval [p,q] to check for a solution: ";
    cin >> p >> q;
    double fp = 0.0, fq = 0.0;
    for (int i = 0; i <= n; i++) 
    {
        fp += coefficient[i] * pow(p, i);
        fq += coefficient[i] * pow(q, i);
    }
    if ((fp < 0 && fq > 0) || (fp > 0 && fq < 0)) 
    {
        cout << "The polynomial has at least one solution in the interval [" << p << "," << q << "]" << endl;
    } 
    else 
    {
        cout << "The polynomial has no solution in the interval [" << p << "," << q << "]" << endl;
    }
    return 0;
}

//Md. Farhan Tahsin Rifty