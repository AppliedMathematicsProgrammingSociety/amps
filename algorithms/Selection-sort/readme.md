# Selection-sort on a list
selection sort is an in-place comparison sorting algorithm. It has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity and has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited.

The algorithm divides the input list into two parts: a sorted sublist of items which is built up from left to right at the front (left) of the list and a sublist of the remaining unsorted items that occupy the rest of the list. Initially, the sorted sublist is empty and the unsorted sublist is the entire input list. The algorithm proceeds by finding the smallest (or largest, depending on sorting order) element in the unsorted sublist, exchanging (swapping) it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right.

### Animation
![Selection-Sort-Animation](https://user-images.githubusercontent.com/119177863/206866998-e702bb32-3afd-4d4e-896e-889d507e4256.gif)
- Red = current minimum
- Yellow = sorted list
- Blue  = current item

### Algorithm
**Problem:**
Sort an integer list in ascending order 

**Input:**
Size of list

**Output:**
Sorted list

**Steps:**
1. Ask user for size of list, echo
2. Generate a list of the specified size comprising of random integers less than 100
3. Print the unsorted list
4. For each of the number in the list, do:
   1. Find the position of the least component in the unsorted list
   2. Swap the positions of the least component and the first component in the unsorted list
   3. Do not consider this least member in the unsorted list anymore (while in the loop)
5. Print the list which is now sorted

### Flowchart
![selection-sort_flowchart](https://user-images.githubusercontent.com/119177863/206867211-e8eeb44d-884e-4400-aa3e-4ff17fd9ee49.png)

### How it works
![selection-sort](https://user-images.githubusercontent.com/119177863/206867228-001a568c-9721-4b2c-9d41-9645c4259892.gif)

