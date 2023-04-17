import math

# first we define the function
# x'=x-t^2

def func(x,t):
    return float(x-(t**2))

# Then we define the exact solution of the function
# x=2+2t+t^2-exp(t)

def exac(t):
    return float(2+(2*t)+(t**2)-(math.exp(t)))

# defining initial conditions
# x(0)=1

h=float(input("Enter the step size:"))
a=0
b=float(input("Enter the endpoint of the interval:"))

x=[]
w=[]
x.append(1)
x.append(exac(0+h))
x.append(exac(0+(2*h)))

p=int((b-a)/h)
i=3

# Using 3 steps adams bashford method to predict and 3 steps adams moulton method to correct

while i<p+2:
    x.append(x[i-1]+((h/12)*((23*func(x[i-1],a+((i-1)*h)))-(16*func(x[i-2],a+((i-2)*h)))+(5*func(x[i-3],a+((i-3)*h))))))
    w.append(x[i-1]+((h/12)*((5*func(x[i],a+((i)*h)))+(8*func(x[i-1],a+((i-1)*h)))-(func(x[i-2],a+((i-2)*h))))))
    i+=1

print("Using 3 steps Adams Bashford method the answer is:",x[p+1])
print("")
print("Using 3 steps Predictor Corrector method the answer is:",w[p-2])
print("")


y=[]
k=[]
y.append(1)
y.append(exac(0+h))
y.append(exac(0+(2*h)))
y.append(exac(0+(3*h)))

i=4

# Using 4 steps adams bashford method to predict and 4 steps adams moulton method to correct

while i<p+2:
    y.append(y[i-1]+((h/24)*((55*func(y[i-1],a+((i-1)*h)))-(59*func(y[i-2],a+((i-2)*h)))+(37*func(y[i-3],a+((i-3)*h)))-(9*func(y[i-4],a+((i-4)*h))))))
    k.append(y[i-1]+((h/24)*((9*func(y[i],a+((i)*h)))+(19*func(y[i-1],a+((i-1)*h)))-(5*func(y[i-2],a+((i-2)*h)))+(func(y[i-3],a+((i-3)*h))))))
    i+=1

print("using 4 steps Adams Bashford method the answer is:",y[p+1])
print("")
print("using 4 steps Predictor Corrector method the answer is:",k[p-3])



