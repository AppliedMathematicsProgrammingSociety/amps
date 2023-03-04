// irteza asif
// 1st march 2023
#include<iostream>
#include <fstream>
#include<string>

using namespace std;

int sol(int i, int n, int k);

int main()
{
    int x[20];
    string t[20];
    int i, n, k, j;
    ifstream infile;

    infile.open("teams.txt"); // opening the text file containing the team names

    cout  << "Number of teams : " << endl;  // inputting number of teams
    cin >> n;

    for(i=0; i<=n-1; i++) getline(infile, t[i]); // reading team names

    if (n%2) {
        n = n+1; // if odd number of teams, a dummy team is added
        t[n-1] = "dummy";
    }

    for (k=1; k<=n-2; k++) // first n-2 rounds
    {
        cout << "\nROUND " << k << endl;

        for (i=0; i<=n-1; i++)  x[i] = 1; // defines a 1xn vector of 1

        for (i=1; i<=n; i++) {
            if (x[i-1]) // checks if team has been assigned a match yet
            {
                if ( (2*i)%(n-1) == k ){
                    if (t[n-1] == "dummy") cout << "Bye round for " << t[i-1] << endl; // if matched with dummy team, its a bye round
                    else cout << t[i-1] <<  " vs " << t[n-1] << endl;
                    x[i-1] = 0;
                    x[n-1] = 0;
                }
                else{
                    j = sol(i, n, k);   // else team i plays team j with (i+j) = k (mod n-1)
                    cout << t[i-1] << " vs " << t[j-1] << endl;
                    x[i-1] = 0;
                    x[j-1] = 0;
                }
            }
            }
    }

    // last round
    cout << "\nROUND " << k << endl;
    for (i=0; i<=n-1; i++)  x[i] = 1; // defines a 1xn vector of 1

    for (i=1; i<=n-2; i++)
    {
        if (x[i-1]) // checks if team has been assigned a match yet
        {
           cout << t[i-1] << " vs " << t[n-2-i] << endl;
           x[i-1] = 0;
           x[n-i-2] = 0;
        }
    }
    if (t[n-1] == "dummy" && x[n-1]) cout << "Bye round for " << t[n-2] << endl; // if matched with dummy team, its a bye round
    else if (x[n-1]) cout << t[n-2] <<  " vs " << t[n-1] << endl;
}

// function that solves (i+j) mod (n-1) = k for j
int sol(int i, int n, int k)
{
    for (int j = 1; j<=n; j++)
    {
        if ( (i+j)%(n-1) == k ) return j;
    }
}
