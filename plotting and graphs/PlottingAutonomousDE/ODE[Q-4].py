#ODE[Q-4]


# Ingredients 

import math as m
import numpy as np
import matplotlib.pyplot as plt


# Declearing the autonomous DE

def f(y):
    dydx =  m.sin(y)
    return dydx


# Defining the grid

x = np.linspace(-5,5,25)
y = np.linspace(-5,5,25)
X,Y = np.meshgrid(x,y)



# Evaluating f(y) at each grid point

dx = np.ones_like(X)
dy = np.sin(Y)


# Plotting the direction field
plt.quiver(X,Y,dx,dy,color="#004953")


#Plotting the critical sol^n/s

plt.axhline(y = 0, color = 'r', linestyle = '-')
plt.axhline(y = m.pi, color = 'r', linestyle = '-')
plt.axhline(y = - m.pi, color = 'r', linestyle = '-')


#Labeling

plt.xlabel("X")
plt.ylabel("Y")
plt.title("Direction Field of dy/dx = Sin(y) ",color="#004953")

plt.show()




#GameMaker//MahfuzIslam
#Assassin//NayeemulHasan



