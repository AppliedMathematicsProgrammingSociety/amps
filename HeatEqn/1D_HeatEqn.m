clear; clc; 

a=sqrt(1.71); L=pi; nterms=5;

xspan=linspace(0,L,50);
tspan=linspace(0,3,60);
[X,T]=meshgrid(xspan,tspan);


syms x t u(x,t,n) f(x) b(n)
f(x)=10;
b(n)=(2./L)*int(f(x)*sin(n*pi*x/L),x,0,L)
u(x,t,n)= b(n)*sin(n*pi*x/L)*exp(-(a*n*pi/L)^2 *t) 


%%a%%  

if diff(u,t)== a^2 *diff(u,x,2)
    fprintf("satisfied")
else
    fprintf("nah")
end


%%b%%  

bn=b(n)


%%c%%  

Arr=zeros(length(tspan),length(xspan));

for n=1:nterms
    Arr=Arr+eval(u(X,T,n));
    figure;
    surf(X,T,Arr)
    title("heat distribution with n terms; where n=",n)
end

Arr;

%%d%%  

surf(X,T,Arr)
title("heat distr with first 5 terms of the FS")



%%e%%  

plot(tspan(2:length(tspan)),Arr(2:length(tspan),floor(size(Arr,2)/2)))
xlabel("time"); ylabel("temp")
title("heat distr of midpoint")


