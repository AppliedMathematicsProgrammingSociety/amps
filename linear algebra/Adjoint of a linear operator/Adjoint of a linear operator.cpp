//204---13(31)
//Find the adjoint of a given linear operator.

#include <iostream>
#include <complex>
#include <iomanip>

using namespace std;

int main() 

{
    int n, m;
    
    cout << "If the linear functional is not in matrix form," << endl;
    cout << "please express it using the coefficients of" << endl; 
    cout << "X1, X2, X3, ..., Xn as both rows and columns in the basis of R^n." << endl;

    cout << "\nEnter the number of rows (n): ";
    cin >> n;
    cout << "Enter the number of columns (m): ";
    cin >> m;
    
    complex<double> A[n][m];
    
    cout << "Enter the values for the matrix A (" << n << "x" << m << "):" << endl;

    for (int i = 0; i < n; i=i+1) 
    {
        for (int j = 0; j < m; j=j+1) 
        {
            double realPart, imagPart;
            cout << "Real part of A[" << i + 1 << "][" << j + 1 << "]: ";
            cin >> realPart;
            cout << "Imaginary part of A[" << i + 1 << "][" << j + 1 << "]: ";
            cin >> imagPart;
            A[i][j] = complex<double>(realPart, imagPart);
        }
    }

    cout << "\nMatrix A:" << endl;
    for (int i = 0; i < n; i=i+1) 
    {
        for (int j = 0; j < m; j=j+1) 
        {
            cout << "(" << A[i][j].real() << showpos << A[i][j].imag() << "i) " << noshowpos;
        }
        cout << endl;
    }
    
    complex<double> transpose[m][n];
    
    for (int i = 0; i < n; i=i+1) 
    {
        for (int j = 0; j < m; j=j+1) 
        {
            transpose[j][i] = conj(A[i][j]);
        }
    }

    cout << "\nConjugate Transpose of Matrix A:" << endl;

    for (int i = 0; i < m; i=i+1) 
    {
        for (int j = 0; j < n; j=j+1) 
        {
            cout << "(" << transpose[i][j].real() << showpos << transpose[i][j].imag() << "i) " << noshowpos;
        }
        cout << endl;
    }
    
    cout << "\nHere, the linear functional is presented in matrix form. In this representation," << endl;
    cout << "each element of every row corresponds to the coefficient terms of X1, X2, X3, ..., Xn" << endl;
    cout << "in the linear function. Additionally, each row corresponds to the coefficients of an individual linear function."<< endl;

    return 0;
}
