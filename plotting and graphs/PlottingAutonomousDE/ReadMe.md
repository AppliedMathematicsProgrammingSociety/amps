# How to plot the direction field of an autonomous DE and it's critical points

The code attached is plotting the direction field for the autonomous differential equation dy/dx = sin(y).


## How?
 
Here's a breakdown of the code . . 

<b> 1. Importing Libraries: </b>

* The required libraries, math, numpy, and matplotlib.pyplot, are imported to perform mathematical operations, create arrays, and generate plots.

<b> 2. Defining the Autonomous Differential Equation: </b>

* The function f(y) is defined, which represents the derivative of y with respect to x. In this case, the function returns sin(y).


<b>3. Creating the Grid:</b>

* The linspace function from numpy is used to create arrays x and y with 25 equally spaced values between -5 and 5.

* The meshgrid function is used to generate two-dimensional arrays X and Y representing a grid of points based on the x and y arrays.

<b>4. Evaluating the Derivative at Each Grid Point:</b>

* Arrays dx and dy are created to store the derivative values at each grid point.
* dx is filled with ones to represent the derivative of x with respect to itself, which is always 1.
* dy is filled with the calculated derivative values obtained by applying the function f(y) to each value in the Y array.


<b>5. Plotting the Direction Field:</b>
* The quiver function from matplotlib.pyplot is used to plot the direction field. It takes X, Y, dx, and dy arrays as input, where X and Y represent the grid points and dx and dy represent the derivative values.

* The resulting plot displays arrows indicating the direction of the derivative at each grid point.


<b>6. Plotting the Critical Solution Values:</b>

* Horizontal lines are plotted using the axhline function to represent the critical solution values of y = 0, y = pi, and y = -pi.


<b>7. Adding Labels and Title:</b>

* Labels for the x-axis and y-axis are added using xlabel and ylabel functions.
A title is added to the plot using the title function.

<b>8. Presenting the Plot:</b>

* The show function is called to display the plot on the screen.


## *Note*


The specific form of the function and the size and density of the grid can be adjusted by the user to visualize different types of autonomous differential equations and explore the behavior of their solutions. 

<b>So, feel free to blend.</b>

## TestRideZone

![Screenshot 2023-05-21 135615](https://github.com/AppliedMathematicsProgrammingSociety/amps/assets/95640041/97abbd34-c4ef-499a-8b20-e2b6e9b99a21)




### Author

- [@NayeemulHasan](https://www.github.com/nayeemulhasan0)
