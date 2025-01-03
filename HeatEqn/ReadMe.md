
# Heat Equation Analysis

![image](https://github.com/user-attachments/assets/b5f3dde7-aa3d-4243-a033-b3be90a74a0f)

### Initialization
```matlab
clear; clc;

a=sqrt(1.71); L=pi; nterms=5;

xspan=linspace(0,L,50);
tspan=linspace(0,3,60);
[X,T]=meshgrid(xspan,tspan);
```
- Clears previous data and sets up parameters.
- Defines `a`, `L`, and number of terms (`nterms`).
- Generates meshgrid for `x` and `t` values.

### Defining the Heat Equation Components
```matlab
syms x t u(x,t,n) f(x) b(n)
f(x)=10;
b(n)=(2./L)*int(f(x)*sin(n*pi*x/L),x,0,L);
u(x,t,n)= b(n)*sin(n*pi*x/L)*exp(-(a*n*pi/L)^2 *t);
```
- Defines symbolic variables.
- Sets function `f(x) = 10`.
- Computes Fourier coefficients `b(n)`.
- Defines solution `u(x,t,n)` for the heat equation.

### Verifying the Heat Equation
```matlab
if diff(u,t)== a^2 *diff(u,x,2)
    fprintf("satisfied")
else
    fprintf("nah")
end
```
- Checks if the partial differential equation is satisfied.

### Computing Fourier Coefficients
```matlab
bn=b(n);
```
- Evaluates the Fourier coefficients.

### Summation of Terms and Visualization
```matlab
Arr=zeros(length(tspan),length(xspan));

for n=1:nterms
    Arr=Arr+eval(u(X,T,n));
    figure;
    surf(X,T,Arr);
    title("heat distribution with n terms; where n=",n);
end

Arr;
```
- Computes the heat distribution using `nterms` terms.
- Plots the evolving heat distribution.

![image](https://github.com/user-attachments/assets/d841be42-8100-4d21-8508-b6d4a31bb9b0)
![image](https://github.com/user-attachments/assets/76129198-18e5-4deb-aed6-a437e1f72ac9)
![image](https://github.com/user-attachments/assets/d1561d18-ac7f-42d0-bf77-b05da124a49c)
![image](https://github.com/user-attachments/assets/89dfa57c-8b30-4075-919d-9df0d663beda)
![image](https://github.com/user-attachments/assets/fb4007be-0fab-456f-83c2-e78514ab89ec)




### Final Heat Distribution Plot
```matlab
surf(X,T,Arr);
title("heat distr with first 5 terms of the FS");
```
- Displays the heat distribution using the first 5 Fourier series terms.

![image](https://github.com/user-attachments/assets/17ab289c-accb-4ef9-b8e1-0b1f077f3cf5)


### Midpoint Temperature Analysis
```matlab
plot(tspan(2:length(tspan)),Arr(2:length(tspan),floor(size(Arr,2)/2)));
xlabel("time"); ylabel("temp");
title("heat distr of midpoint");
```
- Plots the temperature at the midpoint over time.

![image](https://github.com/user-attachments/assets/5f69cb4a-3ca4-48f4-93a6-9afe02f29d66)


## Summary
This MATLAB script solves the heat equation using Fourier series expansion, verifies the solution, and visualizes the temperature distribution over time using surface plots and a midpoint temperature evolution graph.



### Author

- [@NayeemulHasan](https://www.github.com/nayeemulhasan0)
