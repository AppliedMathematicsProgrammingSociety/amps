# Minimum Spanning Tree using Prim's Algorithm

## Algorithm Overview
1. Define and initialize and vector pair g to store all the edges and their weights.
2. Set first vertex value(key) to 0 and all the other vertex(key) to infinity, visited status of all the node to false and parent of all the node to -1.
3. Find minimum value in the key array and set it visited, then check all of its adjacent also update their key value and parent.
4. Repeat this process untill all the nodes are visited.
