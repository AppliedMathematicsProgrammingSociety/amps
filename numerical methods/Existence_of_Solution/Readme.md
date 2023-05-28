
# Existence of a solution

### Code Description
***
This Program reads the degree and coefficients of a polynomial, the interval limits, and calculates the values of the polynomial at the interval endpoints. By checking the signs of the function values, it determines whether the polynomial has at least one solution in the given interval.


### Algorithm
***
1. Start the program.

2. Read the degree of the polynomial, n, from the user.

3. Create an array to store the coefficients of the polynomial of size n+1.

4. Read the coefficients of the polynomial from the user, starting from the constant term and increasing the exponent by one at each step.

5. Read the interval limits, p and q, from the user.

6. Initialize two variables, f(p)(defined as fp) and f(q)(defined as fp), to store the values of the polynomial at points p and q, respectively. Set both variables to 0.

7. For i from 0 to n:

Calculate fp += coefficient[i] * pow(p, i).
Calculate fq += coefficient[i] * pow(q, i).

8. Check if the signs of fp and fq are different:

If (fp < 0 && fq > 0) or (fp > 0 && fq < 0), display "The polynomial has at least one solution in the interval [p,q]."
Else, display "The polynomial has no solution in the interval [p,q]."

9. End the program.

### Sample Run
***
![Existence_0f_Solution](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/74ba1fc2-e7fd-4baf-a710-7e0e84ae862a)


