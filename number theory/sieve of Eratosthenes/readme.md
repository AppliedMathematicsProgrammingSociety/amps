## Sieve of Eratosthenes
The sieve of Eratosthenes is an ancient algorithm for finding all prime numbers up to any given limit. 
It is one of the most efficient ways to find small prime numbers. 
It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the first prime number, 2. 
The multiples of a given prime are generated as a sequence of numbers starting from that prime, with constant difference between them that is equal to that prime. 
This is the sieve's key distinction from using trial division to sequentially test each candidate number for divisibility by each prime. 
Once all the multiples of each discovered prime have been marked as composites, the remaining unmarked numbers are primes.


The earliest known reference to the sieve is in 
[Nicomachus of Gerasa's](https://en.wikipedia.org/wiki/Nicomachus) [Introduction to Arithmetic](https://en.wikipedia.org/wiki/Introduction_to_Arithmetic), 
an early 2nd century CE book which attributes it to [Eratosthenes of Cyrene](https://en.wikipedia.org/wiki/Eratosthenes), a 3rd century BCE 
Greek mathematician, though describing the sieving by odd numbers instead of by primes.

### How it works (for 121)
![Animation_Sieve_of_Eratosth](https://user-images.githubusercontent.com/119177863/225650427-9e2da39e-ed9d-45f7-8737-2abbfd93f83f.gif)

**RED** = multiples of 2 


**GREEN** = multiples of 3 

**BLUE** = multiples of 5


**YELLOW** = multiples of 7


**PURPLE** = the rest of the numbers, i.e. PRIMES

### In Action
![sieve_clip](https://user-images.githubusercontent.com/119177863/225984187-91912867-8a09-491e-b0c7-18d036a5dd51.gif)

### Algorithm
![sieve_algorithm](https://user-images.githubusercontent.com/119177863/225984572-8a8349e6-5d5c-430d-a456-817bb0d5a8a2.png)


### Flowchart
![sieve_flowchart](https://user-images.githubusercontent.com/119177863/225984285-cd2204eb-22a1-4fb2-95d8-1919cb093ef2.png)
