
# Print all numbers in a range without using loops.

### Code Description
***

The given program allows the user to input a starting number and an ending number, and then it prints all the numbers within that range using recursion.

### Algorithm
***
1. Start the program.

2. Declare a function 'Range(int a, int b)'.

3. Inside the 'Range' function:
  * Check if the value of 'a' is less than or equal to 'b'.
      * If true, perform the following steps:

        a. Output the value of 'a' followed by a space.

        b. Call the 'Range' function recursively with 'a' incremented by 1 and the same value of 'b'.
  * If false, return from the function.

4. Inside the main function:
  * Declare two variables 'a' and 'b' to store the range values.
  * Output the message "Enter the starting number: ".
  * Read the starting number from the user and store it in the variable 'a'.
  * Output the message "Enter the ending number: ".
  * Read the ending number from the user and store it in the variable 'b'.
  * Call the Range function with the values of 'a' and 'b'.
5. End the program.

### Sample Run
***
![Number_Range_Without_Loop](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/107662745/4079f5fa-4400-41e2-9f9e-b464f9793bb5)

