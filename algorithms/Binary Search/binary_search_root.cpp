#include<bits/stdc++.h>
using namespace std;
int main (){
    int n;  cin>>n;
    int l=1,h=n,mid,ans=0;
    while(l<=h){
        mid=l+(h-l)/2;
        if(mid*mid<=n){
            ans=max(ans,mid);
            l=mid+1;
        }else h=mid-1;
    }cout<<ans<<endl;
}