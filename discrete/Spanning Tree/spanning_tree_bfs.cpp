#include<bits/stdc++.h>
using namespace std;

const int N = 1e5+10;
vector<int>g[N];
bool vis[N];
vector<int>sp[N];

void bfs(int src){
	queue<int>q;
	q.push(src);
	vis[src] = true;

	while(!q.empty()){
		int c_v = q.front();
		q.pop();
		for(int child:g[c_v]){
			if(!vis[child]){
				q.push(child);
				vis[child] = true;
				sp[c_v].push_back(child);
			}
		}
	}
}

int main() {
	int n,m;
	cout<<"Enter number of vertices and number of edges: \n";
	cin>>n>>m;
	cout<<"Enter the graph: \n";
	for(int i=0;i<m;i++){
		int v1,v2;
		cin>>v1>>v2;
		g[v1].push_back(v2);
		g[v2].push_back(v1);
	}
	bfs(1);
	cout<<"Spanning Tree Using BFS: \n";
	for(int i=0;i<N;i++){
		for(int child:sp[i])
			cout<<i<<" "<<child<<endl;
	}
}
