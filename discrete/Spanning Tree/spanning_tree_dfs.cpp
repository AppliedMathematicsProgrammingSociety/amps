/*
  Evan Mozumder
*/

#include<bits/stdc++.h>
#define ll long long int
using namespace std;

const int N = 1e5+10;

vector<int>g[N];
vector<int>s[N];
bool vis[N];

void dfs(int vertex,int par){
	vis[vertex]=true;
	for(int child:g[vertex]){
		if(vis[child] || child==par)continue;
		s[vertex].push_back(child);
		dfs(child,vertex);
	}
}

int main(){
	int n,e;
	cout<<"Enter number of vertices and number of edges: \n";
	cin>>n>>e;
	cout<<"Enter the graph: \n";
	for(int i=0;i<e;i++){
		int v1,v2;
		cin>>v1>>v2;
		g[v1].push_back(v2);
		g[v2].push_back(v1);
	}
	for(int i=1;i<=n;i++){
		if(vis[i])continue;
		else dfs(i,0);
	}
	cout<<"Spanning Tree Using DFS: \n";
	for(int i=0;i<N;i++){
		for(int child:s[i])
			cout<<i<<" "<<child<<endl;
	}
}
