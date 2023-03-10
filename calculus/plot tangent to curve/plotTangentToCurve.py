import matplotlib.pyplot as plt
import numpy as np

#Shajiratul Yaqueen
#AMTH batch 6
#Purpose : prints a plot of a given function and its tangent at a point
#Inputs : function, point of tnagency
#Outputs : graph of the function and its tangent at the specified point

#Caution 1 : implicit multiplication not supported ie write '3*x' instead of '3x'
#Caution 2 : use '**' instead of '^' for exponentiation


func = input("Enter some function\n")
with open("somePyfile.py", 'w') as file:
    file.write("from math import *\n\ndef f(x):\n\treturn " + str(func))
from somePyfile import f

def fvmpt(x,h):
    return (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/(12*h)

print("Point of tangency")
x = float(input(''))
y = f(x)
#print(y)
m = fvmpt(x,0.0000001)
#print(m)
c = y-m*x
#print(c)

p = x - 10

func = []
tang = []
pnt = []
while p < x + 10:
    func.append(f(p))
    tang.append(m*p+c)
    pnt.append(p)
    p = p+0.1
func = np.array(func)
tang = np.array(tang)
pnt = np.array(pnt)

plt.plot(pnt, func)
plt.plot(pnt, tang)

plt.show()
