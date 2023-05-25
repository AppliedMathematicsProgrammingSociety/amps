#include<iostream>
#include<ctime>
#include<cstdlib>
#include<ios>
#include<limits>

using namespace std;

int main()
{ 
int num;
int guess;
int guessCount = 1;
bool isGuessed;
char PlayerName[100];
 
cout << "Enter your Name: " << endl;
cin.getline(PlayerName,100);

cout << "\nYour objective is to guess the integer between 0 and 100 within 11 guesses." << endl;

srand (time(0));
num = rand() % 100;

isGuessed = false;
while (!isGuessed)
 {
cout << "\nGuess the number : "<< endl;
cin >> guess; 

   if (cin.fail())
    {
      cin.clear();
      cin.ignore(numeric_limits<streamsize>::max(), '\n');
      cout << "Invalid input. Please enter a valid number." << std::endl;
      continue;
    }

cout << "\nNumber of guesses: "<< guessCount<< endl;
cout << "The number you guessed: "<< guess << endl;

   if (guess == num)
     {
       cout << "You guessed the correct number." << endl;
       isGuessed = true;  
     } 
     else if (guess < num)
        cout << "Your guess is lower than the number.\nGuess again!" << endl;
     else
        cout << "Your guess is higher than the number.\nGuess again!" << endl;
    
     guessCount++;
   
   if (guessCount > 11)
      {
         cout <<"You have reached the maximum number of guesses."
              <<"You lost the game :( " << endl;
      }
 }

 cout << "\n \n"<<PlayerName << " took total "
         << guessCount - 1 << " no. of guesses :) " << endl;

return 0;

}


 // Muhammad Sazzad Abrar Saad - 25/05/2023
