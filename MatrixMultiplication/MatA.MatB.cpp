//////////////////////Matrix Multiplication////////////////////////



#include<iostream>
#include<cmath>
using namespace std;

int main()
{
    int a,b,c,d;
    cout<<"Size of Matrix A: ";
    cin>>a>>b;
    cout<<"Size of Matrix B: ";
    cin>>c>>d;

    if(b!=c)
    {
        cout<<"Yampossible!"<<endl;
    }
    else
    {
        
    int MatA[a][b];
    int MatB[c][d];

    cout<<" "<<endl;
    cout<<"Insert Matrix A"<<endl;
    for(int i=0; i<a;i++)
    {
        for(int j=0;j<b;j++)
        {
            cin>>MatA[i][j];
        }
    }

    cout<<" "<<endl;
    cout<<"Insert Matrix B"<<endl;
    for(int i=0; i<c;i++)
    {
        for(int j=0;j<d;j++)
        {
            cin>>MatB[i][j];
        }
    }


    // cout<<"MatrixA"<<endl;
    // cout<<"```````"<<endl;
    
    // for(int i=0; i<a;i++)
    // {
    //     for(int j=0; j<b;j++)
    //     {
    //         cout<<MatA[i][j]<<'\t';
    //     }        
    // cout<<endl;
    // }
        

    // cout<<"MatrixB"<<endl;
    // cout<<"```````"<<endl;

    // for(int i=0; i<c;i++)
    // {
    //     for(int j=0; j<d;j++)
    //     {
    //         cout<<MatB[i][j]<<'\t';
    //     }        
    // cout<<endl;
    // }


    cout<<" "<<endl;
    cout<<"Matrix AB"<<endl;
    cout<<"`````````"<<endl;
    int sum;
    for(int i=0; i<a;i++)
    {
        for(int j=0; j<d;j++)
        {
            sum=0;
            for(int k=0;k<b;k++)
            {
                sum=sum+MatA[i][k]*MatB[k][j];
            }
            cout<<sum<<'\t';
        }        
    cout<<endl;
    }
    
    }



    return 0;
}

