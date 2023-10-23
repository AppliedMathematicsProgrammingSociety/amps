
# Find the Adjoint of a Linear Operator

### Code Description
***

Definition of the adjoint operator:

A linear operator T on an inner product space V is said to have an adjoint operator T∗ on V if

                                          ⟨T(u),v⟩=⟨u,T*(v)⟩

To learn more about adjoint operators you can click on the:  

[Adjoint Operators](https://www.sciencedirect.com/topics/mathematics/adjoint-operator) and [Hermitian adjoint
](https://en.wikipedia.org/wiki/Hermitian_adjoint).

This C++ code is designed to assist in finding the adjoint of a given linear operator represented as a complex matrix. The program takes user input for the dimensions of the matrix, which corresponds to the number of rows and columns. It then prompts the user to enter the complex values for each element of the matrix, allowing for real and imaginary parts to be specified separately.

After receiving the matrix, the code calculates the conjugate transpose of the matrix. The conjugate transpose is a fundamental operation in linear algebra that is often used when dealing with linear operators. It involves taking the transpose of the matrix (swapping rows and columns) and then conjugating the elements by negating their imaginary parts.

The code provides the user with the resulting conjugate transpose of the input matrix, displaying both the real and imaginary parts of the complex values. It also offers a brief explanation of how the linear functional representation corresponds to the matrix, where each row represents an individual linear function, and each element within a row corresponds to the coefficients of variables like X1, X2, X3, ... , Xn.

### Algorithm
***

1. Start the program.

2. Display an introductory message to the user:
   "If the linear function is not in matrix form, please express it using the coefficients of X1, X2, X3, ..., Xn as both rows and columns in the basis of R^n."

3. Initialize variables:

   a. n, m: Integers to store the number of rows and columns of the matrix.

   b. A[n][m]: A 2D complex array to store the input matrix.

   c. adjoint[m][n]: A 2D complex array to store the adjoint (conjugate transpose) of A.

4. Prompt the user for the number of rows (n) and columns (m) for the matrix A.

5. Create a nested loop to input values for the matrix A:

   For i from 0 to n-1:

     For j from 0 to m-1:

       a. Prompt the user for the real and imaginary parts of A[i][j].

       b. Store the entered values as a complex number in A[i][j].

6. Display the matrix A to the user using a nested loop:

   For i from 0 to n-1:

     For j from 0 to m-1:

       a. Print the real and imaginary parts of A[i][j].

7. Create a nested loop to calculate the adjoint (conjugate transpose) of A and store it in the 'adjoint' array:

   For i from 0 to n-1:

     For j from 0 to m-1:

       a. Calculate the conjugate of A[i][j].

       b. Store the conjugate value in adjoint[j][i].

8. Display the adjoint (conjugate transpose) of A to the user using a nested loop:

   For i from 0 to m-1:

     For j from 0 to n-1:

        Print the real and imaginary parts of adjoint[i][j].

9. Display a message to explain that, "The linear functional is presented in matrix form. In this representation, each element of every row corresponds to the coefficient terms of X1, X2, X3, ..., Xn in the linear function. Additionally, each column corresponds to an individual linear function."

10. End the program.

### Sample Run
***

***For type-1 questions:***

![1](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/b8be9240-a923-4558-9c99-1dee96695acf)

Output:

![2](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/9df62631-4b14-44f1-ab59-b33b403fced1)


***For type-2 questions:***

![3](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/420b85b0-7730-4e75-9035-570c1b5e78a0)

Output:

![4](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/662cd4a2-12d5-4bb2-bc6e-f4fb97a10e87)
![5](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/ff60f10b-773c-434a-b86c-3c64eea74ea9)

From this we can say that the answer would be:

T*(x,y,z) = (x+3y, 2x+z, -4y)
