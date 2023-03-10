## Plotting tangent to a curve at a specific point  

In AMTH 102 course, we learn how to plot a curve and its tangent. Plotting a curve using python is easy, as show [here](https://github.com/yakeen15/amps/tree/main/plotting%20and%20graphs#readme).
Now we will see how we can plot the same curve and specify a point to get the curves tangent at that point.  
We use the [plotTangentToCurve.py](https://github.com/yakeen15/amps/blob/main/calculus/plotTangentToCurve.py) script for this demonstration. But first we must understand 
the basics of the tangent line. A tangent line to curve at a point, is defined as the straight line that "just touches" a curve at that specific point. Which means the line 
will not go through any other point of that curve in or around that neighbourhood. Now, how do we find this straight line?  
Suppose $y=f(x)$ is a function. We need to find the tangent line to this function at the point $(x_0 , y_0)$. Suppose we know the derivative of the function at that point, 
meaning we know the value $m=\frac{dy}{dx}$ at $(x_0 , y_0)$. Now with this knowledge, we can easily find the tangent line as the straight line that goes through $(x_0 , y_0)$ 
and has slope $m$.  
We open the script, and input function $sin(x)$ as our function and $x=0$ as our point of tangency, to get the result below.  ![](https://raw.githubusercontent.com/yakeen15/amps/main/calculus/images/tangent.png)
