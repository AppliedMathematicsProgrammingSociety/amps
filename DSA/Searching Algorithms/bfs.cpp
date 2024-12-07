#include<bits/stdc++.h>
using namespace std;

#define pii pair<int, int>

int level[8][8];
bool visited[8][8];


vector<pii> dir = {{-1, 2}, {-1, -2}, {1, 2}, {1, -2}, {2, 1}, {2, -1}, {-2, 1}, {-2, -1}};


bool isValid(int i, int j){
    return (i >= 0 && i < 8) && (j >= 0 && j < 8);
}

void bfs(pii s){
    queue<pii> q;
    q.push(s);
    
    visited[s.first][s.second] = true;
    level[s.first][s.second] = 0;

    while(!q.empty()){
        pii u = q.front();
        q.pop();

        int i = u.first, j = u.second;
        for(auto d : dir){
            int new_i = i + d.first;
            int new_j = j + d.second;

            if(isValid(new_i, new_j) && !visited[new_i][new_j]){
                q.push({new_i, new_j});
                visited[new_i][new_j] = true;
                level[new_i][new_j] = level[i][j] + 1;
            }
        }

    }
}

void reset_level_vis(){
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            visited[i][j] = false;
            level[i][j] = 0;
        }        
    }
    
}

// 0 based indexing

int main(){
    pii knight1, knight2, dest;


    cout << "Initial coordinate of knight 1: ";
    cin >> knight1.first >> knight1.second;

    cout << "Initial coordinate of knight 2: ";
    cin >> knight2.first >> knight2.second; 

    cout << "Final coordinate where both meet: ";
    cin >> dest.first >> dest.second;

    reset_level_vis();
    bfs(knight1);

    cout << "It will take minimum " << level[dest.first][dest.second] << " moves for knight 1" << endl;

    reset_level_vis();
    bfs(knight2);

    cout << "It will take minimum " << level[dest.first][dest.second] << " moves for knight 2" << endl;

    

    return 0;
}
