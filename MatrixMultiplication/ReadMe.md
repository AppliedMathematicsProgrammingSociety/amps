
# What's Inside?

This program performs matrix multiplication of two matrices (of any size) A and B given by the user. 


## How?
 
Here's how the program works:


* The program asks the user for the dimensions of two matrices, A and B. The dimensions are represented by the variables a, b, c, and d, where a represents the number of rows in Matrix A, b represents the number of columns in Matrix A. Same case for Matrix B.


* Two 2D arrays, MatA and MatB, are declared to store the elements of matrices A and B, respectively. The sizes of these arrays are determined by the user's input.



* The program prompts the user to enter the elements of Matrix A. It uses nested for loops to iterate over each element of the matrix and stores the input values in the MatA array. Similar for Matrix B.

* The program performs matrix multiplication using nested for loops. It uses three loops: the outer loop iterates over the rows of Matrix A, the middle loop iterates over the columns of Matrix B, and the innermost loop iterates over the columns of Matrix A (or rows of Matrix B).


* For each element in the resulting matrix AB, the program calculates the sum of the products of corresponding elements from Matrix A and Matrix B. This is done by multiplying the elements of Matrix A from the current row with the elements of Matrix B from the current column, and accumulating the sum in the variable sum.

* After calculating the sum, the program prints the value and adds a tab character to separate the elements of the resulting matrix.

* The loops continue until all elements of the resulting matrix AB have been calculated and printed.

Once the matrix multiplication is complete, the program shows the evaluated results in the terminal & exits.



## *Note*


There are commented-out sections in the code that were meant to print matrices A and B before the multiplication step. These sections can be uncommented if you want to see the input matrices.




## TestRideZone

Here is an example:
![Screenshot 2023-06-12 212148](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/95640041/b5726564-50d9-4234-b9ac-7cbd3f69ed41)
Another one:
![Screenshot 2023-06-12 212037](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/95640041/4f686617-b5b5-46b7-bd17-70ddb9bbbefb)


### Author

- [@NayeemulHasan](https://www.github.com/nayeemulhasan0)

