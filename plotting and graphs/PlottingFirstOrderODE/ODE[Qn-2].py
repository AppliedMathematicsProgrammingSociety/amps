#ODE[Qn-2]



# Ingredients 

import math as m
import numpy as np
import matplotlib.pyplot as plt


# Declearing the function f(x,y) 

def f(x,y):

    dydx = x + m.sin(y)                                          # wanna try others?                                                    
    # dydx = x + y                                               # 
    # dydx=y**2                                                  # then, you've to !comment dydx & the corr. dy;
    # dydx=(x**2-y**2)/(1+x**2+y**2)                             # and comment out previous combo
    # dydx=(x**2)/(1-x**2-y**2)                                  # 
                                                                 # or why don't you just try yours . . .
    
    return dydx


# Defining the grid

x = np.linspace(-5,5,25)
y = np.linspace(-5,5,25)
X,Y = np.meshgrid(x,y)



# Evaluating f(x,y) at each grid point

dx = np.ones_like(X)
dy = X + np.sin(Y)
# dy = X + Y
# dy=Y**2
# dy=(X**2-Y**2)/(1+X**2+Y**2)
# dy=(X**2)/(1-X**2-Y**2)



# Plotting the direction field
plt.quiver(X,Y,dx,dy,color="#004953")


# Beautification is in progress ...

plt.xlabel("x")
plt.ylabel("y")
plt.title("Direction Field of dy/dx = f(x,y)",color="#004953")


# Showing Off
plt.show()




#GameMaker//MahfuzIslam
#Assassin//NayeemulHasan
