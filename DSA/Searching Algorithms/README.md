DFS Problem:

### Question:

Byteland has \( n \) cities and \( m \) roads between them. The goal is to construct new roads so that there is a route between any two cities.

Your task is to find out the **minimum number of roads required** and also determine which roads should be built.

---

#### Input:
The first input line has two integers \( n \) and \( m \):  
- \( n \): the number of cities.  
- \( m \): the number of existing roads.

The next \( m \) lines describe the existing roads. Each line has two integers \( a \) and \( b \), indicating there is a road between these two cities.

#### Constraints:
- \( 1 \leq n \leq 10^5 \)  
- \( 1 \leq m \leq 2 \cdot 10^5 \)  
- \( 1 \leq a, b \leq n \)

#### Output:
1. Print an integer \( k \): the number of required roads.  
2. Then, print \( k \) lines describing the new roads to be built. Each line contains two integers \( u \) and \( v \), representing a road to be built. You can print any valid solution.

---

#### Example:

**Input**:
```
4 2
1 2
3 4
```

**Output**:
```
1
2 3
```

---

### Explanation:
The cities are grouped into two connected components: \(\{1, 2\}\) and \(\{3, 4\}\). To connect all cities, one road is needed between these two groups (e.g., between city 2 and city 3).
