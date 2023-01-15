## HANGMAN
The [rules](https://www.wikihow.com/Play-Hangman) of *Hangman* is as follows:
* The game is played between two players or more
* One player chooses a phrase, which could be a random word or the name of anything.
* The player choosing the phrase draws the stage for *hanging* and puts dashes where the letters of the phrase should go.
* The rest of the players then need to guess the letters of the phrase one by one.
* When the players guess a letter correctly, the other player has to put the letter in the blank places where it belongs.
* At this point, the other players can guess the entire phrase based on the position of the letters they correctly guessed.
* If the players guess a letter that doesn't belong to the phrase, it will count as a strike. In that case, first, the rope of the *hangman* will be drawn. The next strike will result in the drawing of the head, and so on.
* After a total of six wrong guesses, the entire *hangman* will be drawn.
* The game ends by correctly guessing the phrase or by the completion of the drawing of the *hangman*.

In this code, the code itself gives the phrase but not on its own. A library of phrases can be listed in a CSV file and given as input. Every time the code is executed, a random phrase is selected from the list. The CSV file of the names of the faculty members of the Department of Applied Mathematics is attached here. 
After running the code, the terminal will ask for a letter, and a separate window will pop up drawing the stage for *hanging*. After each successful guess of a letter, the terminal will prompt you to guess the whole phrase. This can be skipped by pressing `Enter` or by inputting a random value without any penalty.
Be mindful of the letters you already guessed. Giving a letter that gave you a strike again will result in another strike. You can scroll up the terminal to see the letters you previously tried to guess.

If you create a new CSV file, put it in the same folder as the code and replace the name `names list.csv` from the following block in the main code.
``` 
name_list = open('names list.csv', 'r')
```
Add phrases in new rows in that case.
