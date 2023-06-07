fprintf('This problem is designed to solve the differential equation diff(y)=ty+1\n\n')
fprintf('The time interval for this problem is 0<=t<=1 \n\n')

y(1)=1;
h=0.25;

fprintf('Iteration no       Forward Euler Method \n\n')
fprintf(' %5d %24f \n',1,y(1))

for i=2:5
    t(i-1)=(i-1)*h;
    y(i)=y(i-1)+(h*((t(i-1)*y(i-1))+1));
    fprintf(' %5d %24f \n',i,y(i))
end

fprintf('The answer at t=0 using Forward Euler Method is : %f \n\n',y(5))


k(1)=1;
fprintf('Iteration no       Forward Euler Method \n\n')
fprintf(' %5d %24f \n',1,k(1))

for i=2:5
    t(i-1)=(i-1)*h;
    k(i)=((k(i-1)+h)/(1-(h*t(i-1))));
    fprintf(' %5d %24f \n',i,k(i))
end

fprintf('The answer at t=0 using Backward Euler Method is : %f \n',k(5))