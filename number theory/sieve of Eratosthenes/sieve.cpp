// Irteza Asif - 17 March 2023
#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

int main()
{
    vector<bool> a;
    int i, n, j;

    ask: cout << "Enter a positive integer : \n";
    cin >> n;
    cout << "The number you wrote = " << n << endl;

    if (n>0) {  // positive checker
    for (i=1; i<=n; i++) a.push_back(1);    // initializes array of 1's of size n

    for (i=2; i<= floor(sqrt(n)); i++) {
        if (a[i-1]) {
            j = 2;
            while(i*j <= n) { // this loop assigns 0 to index that is multiple of a prime (i.e. composites)
                a[i*j-1] = 0;
                j = j+1;
    }}}

    j=0;
    cout << "\nPrimes : \n";
    for (i=2; i<=n; i++) { // prints all the primes{
        if (a[i-1]) {
            cout << i << " " ;
            j = j+1;
    }}
    cout << "\n\nNumber of primes less than " << n << " is = " << j << endl;
    }
    else {
    cout << "\nInput a positive integer pls bro\n";
    goto ask;
    }
}

