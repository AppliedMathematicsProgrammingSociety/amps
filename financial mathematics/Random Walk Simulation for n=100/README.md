## Brownian Motion Approximated by Random Walk n=100

In mathematics, a random walk is a random process that describes a path that consists of a succession of random steps on some mathematical space. Consequently in the world of finance, the theory of random walk suggests that the stock price today has no relation or influence on the stock price tomorrow, and the direction the stock price goes is entirely unpredictable. This in turn suggests that random walk is a stochastic process which is used to describe a path taken by an object which is seemingly random.

#Presenting an example for all this randomness

Suppose a company you own has a stock price of 500 taka and a step size of 50 taka. Since every step the price will take moving forward is random, it can increase by 550 taka the next day or even decrease by 450 taka. The day after that, the pricing can have four possible outcomes: 550 taka can end up being 500 taka or 600 taka and 450 taka can end up being 400 taka or 500 taka.

#So how does the code work?

A built in library called random is used to return a randomly selected element from the specified sequence of list containing 'Up' and 'Down.' From the initial coorodinates of (x, y) being (0, 0) and the second plotted point being either of the four: (0, 1), (0, -1), (0, 1) and (0, -1) various values of y are taken upto timepoints of n=100. Using a loop to set y=y+1 for every randomly generated 'Up' and y=y-1 for every randomly generated 'Down' from 1 to n+1, these random values of y are considered as a step up or step down and is stored in an array or list, alongside values of x upto n=100 stored in a seperate array or list. The walk thus has a position for y axis and a timestamp for y axis, wherein the list for holding all the values of x stops at n+1, starts at 0 and has an increament of 1. Plotting all (x, y) gives the desired 2D random walk.

![](https://github.com/AppliedMathematicsProgrammingSociety/amps/blob/475576c1c807250e232c42406c8f34d3c111816f/financial%20mathematics/Random%20Walk%20Simulation%20for%20n=100/random%20walk.png)

![](https://github.com/AppliedMathematicsProgrammingSociety/amps/blob/475576c1c807250e232c42406c8f34d3c111816f/financial%20mathematics/Random%20Walk%20Simulation%20for%20n=100/random%20walk%20(2).png)

![](https://github.com/AppliedMathematicsProgrammingSociety/amps/blob/475576c1c807250e232c42406c8f34d3c111816f/financial%20mathematics/Random%20Walk%20Simulation%20for%20n=100/random%20walk%20(3).png)

![](https://github.com/AppliedMathematicsProgrammingSociety/amps/blob/475576c1c807250e232c42406c8f34d3c111816f/financial%20mathematics/Random%20Walk%20Simulation%20for%20n=100/random%20walk%20(4).png)
