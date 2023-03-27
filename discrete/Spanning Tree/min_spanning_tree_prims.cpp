#include<bits/stdc++.h>
using namespace std;


int main() {
	int n,m;
	cout<<"Enter number of nodes and edges: \n";
	cin>>n>>m;
	vector<pair<int,int>>g[n+1];
	vector<int>key(n+1);
	vector<bool>vis(n+1);
	vector<int>parent(n+1);
	cout<<"Enter the graph with weight\n";
	for(int i=0;i<m;i++){
		int v1,v2,wt;
		cin>>v1>>v2>>wt;
		g[v1].push_back({v2,wt});
		g[v2].push_back({v1,wt});
	}
	for(int i=0;i<=n;i++){
		key[i]=INT_MAX;
		vis[i]=false;
		parent[i]=-1;
	}

	key[1]=0;
	parent[1]=-1;

	for(int i=1;i<n;i++){
		int mini = INT_MAX;
		int u;

		// find the minimum node 
		for(int v=1;v<=n;v++){
			if(!vis[v] && key[v]<mini){
				u=v;
				mini=key[v];
			}
		}

		// mark minimum node as true
		vis[u] = true;

		// check all its adjacent nodes
		for(auto adj:g[u]){
			int v = adj.first;
			int w = adj.second;
			if(!vis[v] && w<key[v]){
				parent[v]=u;
				key[v]=w;
			}
		}
	}
	int total_w=0;
	cout<<"\nminimum spanning tree: \n";
	for(int i=2;i<=n;i++){
		cout<<i<<" "<<parent[i]<<" "<<key[i]<<"\n";
		total_w+=key[i];
	}
	cout<<"\ntotal weight: "<<total_w<<"\n";
}
