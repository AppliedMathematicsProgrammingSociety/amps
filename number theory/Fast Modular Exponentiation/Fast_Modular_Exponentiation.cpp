#include <iostream>
#include <cmath>

using namespace std;

void BinaryConversion(int e, int bit[], int& k);
int FastModularExponentiation(int n, int bit[],int k,int m);


int main()
{
    int bit[50],e,k,i,n,m,a;

    cout << endl;

    cout << "Here we will determine the value of a^e mod n that is," << endl;
    cout << "the remainder that we will obtain when we divide a^e by n." << endl;

    cout << endl;

    cout << "a = ";
    cin >> a;
    cout << endl;
    cout << "e = ";
    cin >> e;
    cout << endl;
    cout << "n = ";
    cin >> n;
    

    BinaryConversion(e,bit,k);

    /*for (i=k-1;i>=0;i--)
    {
       cout << bit[i];
    }*/

    cout << endl;

    cout << a << "^" << e << " mod " << n << " = " << FastModularExponentiation(a,bit,k,n) << endl << endl;

    return 0;
}

void BinaryConversion(int e, int bit[], int& k)
{
    int i, n, temp;
    n=e;
    i=0;
    while(n != 0)
    {
        if((n%2)!=0)
        {
            bit[i]=1;
            i=i+1;
        }
        else{
            bit[i]=0;
            i=i+1;
        }
        n = n/2;
    }
    k = i;
}
int FastModularExponentiation(int n, int bit[],int k, int m)
{
    int c,f,i,a,d,t;

    a=n;
    t=m;
    c=0;
    f=1;

    for (i=k-1;i>=0;i--)
    {
        c=c*2;
        f=(f*f)%t;
        if(bit[i]==1)
        {
            c=c+1;
            f=(f*a)%t;
        }
    }
    return f;
}