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
