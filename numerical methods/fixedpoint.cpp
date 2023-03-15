#include<bits/stdc++.h>
using namespace std;

double f(double x){
    return x*x*x + 4*x*x -10;
}

double g(double x){
    return sqrt(10/(4+x));
}
int main(){
    double x0,x1,tol=0.0001;
    int i,max_iter=1000;

    cout<<"Enter the intial guess : ";
    cin>>x0;

    for(i=1;i<=max_iter;i++){
        x1=g(x0);

        if(abs(f(x1))<tol)
            {
                cout<<"The root x = "<<x1;
                break;
            }
        x0=x1;
    }
    return 0;
}
