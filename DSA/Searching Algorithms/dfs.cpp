#include<bits/stdc++.h>
using namespace std;
 
int cc=0;
const int N = 1e5+5;
vector<int> adj[N];
bool visited[N];
 
 
void dfs(int u){
    visited[u] = true;
 
    for(auto v : adj[u]){
        if(visited[v]) continue;
        dfs(v);
    }
}
 
int main(){
    int n, m;
    cin >> n >> m;
 
    for(int i=1; i<=m; i++){
        int a, b;
        cin >> a >> b;
        adj[a].push_back(b);
        adj[b].push_back(a);   
    }
 
    vector<int> nodes;
 
    for(int i=1; i<=n; i++){
        if(visited[i]) continue;
        dfs(i);
        cc++;
        nodes.push_back(i);    
    }
 
    int k = cc-1;
    cout << k << endl;
    
    for(int i=1; i<=k; i++){
        int back = nodes.back();
        nodes.pop_back();
        adj[nodes.back()].push_back(back);
        adj[back].push_back(nodes.back());
        cout << nodes.back() << " " << back << endl;
    }
    
 
    return 0;
}
