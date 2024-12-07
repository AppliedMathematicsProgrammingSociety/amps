# DFS Problem: Building Roads 

Byteland has n cities and m roads between them. The goal is to construct new roads so that there is a route between any two cities.

Your task is to find out the **minimum number of roads required** and also determine which roads should be built.

## Problem Description

### Input:
1. The first input line has two integers n and m :  
   - n: the number of cities.  
   - m: the number of existing roads.
2. The next m lines describe the existing roads. Each line has two integers a and b, indicating there is a road between these two cities.

### Output:
1. Print an integer k: the number of required roads.  
2. Print k lines describing the new roads to be built. Each line contains two integers u  and v , representing a road to be built. You can print any valid solution.

### Constraints:
- 1 <= n <= 10^5  
- 1 <= m <= 2 * 10^5   
- 1 <= a, b <= n

---

## Example

### Input:
```
4 2
1 2
3 4
```

### Output:
```
1
2 3
```

### Explanation:
The cities are grouped into two connected components: {1, 2} and {3, 4}. To connect all cities, one road is needed between these two groups (e.g., between city 2 and city 3).

---


# BFS Problem: Minimum Moves for Knights to Meet

Given an 8x8 chessboard, two knights start at different positions. Your task is to determine the minimum number of moves required for each knight to reach a given destination on the board.

### Input Format:
1. The initial position of **Knight 1** as two integers.
2. The initial position of **Knight 2** as two integers.
3. The target position (destination) as two integers. 

### Output Format:
1. The minimum number of moves required for **Knight 1** to reach the destination.
2. The minimum number of moves required for **Knight 2** to reach the destination.

### Constraints:
1. The chessboard size is fixed at **8x8**.
2. Knights move in an "L" shape, i.e., they can move two squares in one direction and one square perpendicular to that, or vice versa.
3. The input positions and destination are guaranteed to lie within the bounds of the chessboard.

### Sample Input/Output:
#### Input:
```
Initial coordinate of knight 1: 0 0
Initial coordinate of knight 2: 7 7
Final coordinate where both meet: 4 4
```

#### Output:
```
It will take minimum 4 moves for knight 1
It will take minimum 2 moves for knight 2
```



