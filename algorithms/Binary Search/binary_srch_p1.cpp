#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n, l = 0;
    cin >> n;
    int h = n - 1;
    vector<int> v(n);
    for (int i = 0; i < n; i++)
    {
        cin >> v[i];
    }
    int mid;
    while (h - l > 1)
    {
        mid = l + (h - l) / 2;
        if (v[mid] > v[mid - 1] and v[mid] < v[mid + 1])
        {
            l = mid;
        }
        else
        {
            h = mid;
        }
    }
    cout << mid;
}