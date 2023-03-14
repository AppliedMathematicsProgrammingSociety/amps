import numpy as np
from math import sin, log
from tabulate import tabulate
#given a linear equation of the form y'' = py' + qy + r
#p q r are only functions of x

def p(x):
    return -2/x
def q(x):
    return 2/x**2
def r(x):
    return sin(log(x))/x**2

a , b = 1 , 2
y0 = 1
yn1 = 2
h = 0.1
n = round(((b-a)/h)-1)
i = 0
x = np.zeros(n+2)
while i<n+2:
    x[i] = a+i*h
    i = i + 1
matA = np.zeros((n, n))
matb = np.zeros(n)
matA[0,0] = 2+h*h*q(x[1])
matA[0,1] = -1+h*p(x[1])/2
matA[n-1,n-2] = -1-h*p(x[n])/2
matA[n-1,n-1] = 2+h*h*q(x[n])
matb[0] = -h*h*r(x[1])+ (1+h*p(x[1])/2)*y0
matb[n-1] = -h*h*r(x[n])+ (1-h*p(x[n])/2)*yn1
i = 1
while i < n-1:
    matA[i,i-1] = -1-h*p(x[i+1])/2
    matA[i,i] = 2+h*h*q(x[i+1])
    matA[i,i+1] = -1+h*p(x[i+1])/2
    matb[i] = - h*h*r(x[i+1])
    i = i + 1
invA = np.linalg.inv(matA)
y = []
y.append(y0)
temp = np.matmul(invA,matb)
for item in temp:
    y.append(item)
y.append(yn1)
print(tabulate(zip(range(0,n+2),x,y),headers=['Itr','x','y'],tablefmt='orgtbl'))
