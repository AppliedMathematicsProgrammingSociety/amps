# Guess the number

![Guess the number](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/124142616/a152b101-76b8-4c04-a97d-c04a0697ffff)

### Code Description:

The given code is a number-guessing game where the user has to guess a randomly generated number between 0 and 100. The program prompts the user to enter their name and provides instructions for the game. It then allows the user to make guesses within a limit of 11 guesses. After each guess, the program provides feedback on whether the guess is higher or lower than the target number. If the user guesses the correct number within the allowed number of guesses, they win the game. If the user exceeds the maximum number of guesses, they lose the game. The program keeps track of the number of guesses taken by the user and displays the final result, including the number of guesses made.

### Algorithm:

1. Start the program.
2. Declare variables: num, guess, guessCount, isGuessed, and PlayerName.
3. Prompt the user to enter their name and store it in the PlayerName variable.
4. Print the objective of the game to the user.
5. Generate a random number between 0 and 100 and store it in the num variable.
6. Set isGuessed to false.
7. Start a loop until isGuessed is true.
8. Prompt the user to guess the number and store the input in the guess variable.
9. Check if the input is a valid number. If not, clear the input stream, ignore the invalid input, and ask the user to enter a valid number. Repeat step 8.
10. Increment the guessCount variable.
11. Print the number of guesses and the guessed number.
12. Check if the guess is equal to the random number.
  -   a. If yes, print a message indicating that the user guessed the correct number and set isGuessed to true.
  -   b. If the guess is lower than the number, print a message indicating that the guess is lower and ask the user to guess again.
  -   c. If the guess is higher than the number, print a message indicating that the guess is higher and ask the user to guess again.
13. Check if the number of guesses exceeds 11.
  -   a. If yes, print a message indicating that the user has reached the maximum number of guesses and lost the game. End the loop.
14. Repeat from step 8.
15. After the loop ends, print the number of guesses the user took to guess the number.
16. End the program.
