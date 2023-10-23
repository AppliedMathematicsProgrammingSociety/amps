#include<bits/stdc++.h>
using namespace std;
int peak_find(vector<int>&v,int n){
    int l=0,h=n-1;
    int ans=-1;
    while(h-l>0){
        int mid=l+(h-l)/2;
        if(mid==0 and v[mid]>v[mid+1]) return mid;
        else if(mid==n-1 and v[mid]>v[mid-1]) return mid;
        else if(v[mid]>v[mid-1] and v[mid]>v[mid+1]){return mid;}
        else if(v[mid]>v[n-1]){ l=mid+1;}
        else {h=mid-1;}
    }
    return -1;
}
int main(){
    int n;  cin>>n;
    vector<int>v(n);
    for(int i=0; i<n; i++){
        cin>>v[i];
    }
    cout<<peak_find(v,n);
}