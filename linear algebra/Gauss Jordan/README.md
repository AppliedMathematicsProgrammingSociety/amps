# GAUSS-JORDAN ELIMINATION
[Gauss-Jordan elimination](https://en.wikipedia.org/wiki/Gaussian_elimination) is a method used to solve systems of linear equations by transforming the augmented matrix of the system into row echelon form and then into reduced row echelon form. The method is named after the mathematicians *[Carl Friedrich Gauss](https://en.wikipedia.org/wiki/Carl_Friedrich_Gauss)* and *[Wilhelm Jordan](https://en.wikipedia.org/wiki/Wilhelm_Jordan_(geodesist))*.

The augmented matrix of a system of linear equations is obtained by augmenting the matrix of the coefficients of the variables with a column of the constants of the equations. The method involves performing a series of elementary row operations on the augmented matrix, such as multiplying a row by a nonzero constant, adding a multiple of one row to another row, or interchanging two rows.

The goal of the method is to transform the augmented matrix into row echelon form, which means that the matrix has the following properties:

* All rows consisting entirely of zeros are at the bottom of the matrix.

* The first nonzero entry (called the pivot) of each nonzero row is to the right of the pivot of the row above it.

Once the augmented matrix is in row echelon form, the method then transforms it into reduced row echelon form, which means that the matrix has the additional property:

* The pivot of each nonzero row is equal to 1, and all other entries in the same column as the pivot are zero.

When the augmented matrix is in reduced row echelon form, the solutions to the system of linear equations can be easily read off from the matrix. If a row of the matrix corresponds to an equation that has no variables left on the left-hand side (i.e., it has only constants), then the solution to that equation is the constant on the right-hand side. If a row of the matrix corresponds to an equation that has one variable left on the left-hand side, then the solution to that variable is the constant on the right-hand side. If a row of the matrix corresponds to an equation that has two or more variables left on the left-hand side, then the system has infinitely many solutions, which can be expressed in terms of the free variables.

The attatched code finds the unique solution when the number of variables is the same as the number of equations. The code can tell if there are infinitely many solutions but cannot give the solutions. Use the `mat.txt` text file to input the augmented matrix by only including the coefficients including signs but excluding any braces. 
