#include<bits/stdc++.h>
using namespace std;
double func(double x){
      return x*x*x+4*x*x-10;
}
int main()
{
    double x0,x1,x2,eps=0.0001;
    cout<<"Enter the initial guess:"<<endl;
    cin>>x0>>x1;

    if(func(x0)*func(x1)>0)
    cout<<"Enter a valid interval"<<endl;

    else{
    while(abs(func(x2))>=eps){
        
        x2=(x0*func(x1)-x1*func(x0))/(func(x1)-func(x0));
        
        if(func(x0)*func(x2)>0)
            x0=x2;
        else
            x1=x2;
    }

    cout<<"The root is : "<< x2 <<endl;
    }
 return 0;
}