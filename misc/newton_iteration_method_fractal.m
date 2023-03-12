
clear all ; clc;
f = @(z) z.^3-1; fp = @(z) 3*z.^2;
xmin=-2; xmax=2; ymin=-2; ymax=2;
kx=10000;ky=10000;
x=linspace(xmin,xmax,kx); y=linspace(ymin,ymax,ky);
[a,b]=meshgrid(x,y);
z=a+i*b;
n=50;
for j=1:n
z = z - f(z)./fp(z);
end
x1=1;
x2=-0.5+i*sqrt(3)/2;
x3=-0.5-i*sqrt(3)/2;
tor=0.001;
z1= abs(z-x1)<tor;z2= abs(z-x2)<tor;
z3= abs(z-x3)<tor;z4= ~(z1+z2+z3);
figure;
map = [1 1 0; 1 0 1; 0 1 1; 0 0 0];
colormap(map);
zeta=(z1+2*z2+3*z3+4*z4);
image([xmin xmax], [ymin ymax], zeta); set(gca,'YDir','normal')
axis equal;
axis tight;