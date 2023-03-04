%Tanzeem Ahmed
%AMTH06
%one step binomial tree for european call option
clc; clear all
r=input('Enter the rate of interest in decimal: ')
T=input('Enter the time for which the option on the stock price lasts: ')
u=input('Enter the up value by which the stock price moves: ')
d=input('Enter the down value by which the stock price moves: ')
fu=input('Enter the payoff from the option if the stock price moves up: ')
fd=input('Enter the payoff from the option if the stock price moves down: ')
p=(exp(r*T)-d)/(u-d)
f=exp(-r*T)*((p*fu)+((1-p)*fd))
