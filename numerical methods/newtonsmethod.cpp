#include<bits/stdc++.h>
using namespace std;

double f(double x){
    return x*x*x + 4*x*x - 10;  
}
double f_prime(double x){
    return 3*x*x + 8*x ;
}

int main(){
    double x0,x1,tol=0.0001;
    int i,max_iter=1000;

    cout<<"Enter the initial guess : ";
    cin>>x0;

    for(i=1; i<=max_iter ; i++)
    {
        x1= x0 - (f(x0)/f_prime(x0));
        if(abs(f(x1))<tol)
            {
                cout<<"The root x = "<<x1;
                break;
            }
        x0=x1;
    }
    return 0;
}