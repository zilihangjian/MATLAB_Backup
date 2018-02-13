function [x,t] = PracticeODE(A,deltat,N)
%Solves with Eulers Method
%y'(t) = 4exp(.8t) - .5y, y(0) = 2
%Compare to (4/1.3)*(exp(.8*t) - exp(-.5*t)) + 2*exp(-.5*t)
y = [1:N+1];
y(1,1) = A;
time = [1:N+1];
for n=1:N+1
    time(1,n) = n*deltat;
end

for n=2:N+1
    y(1,n) = y(1,(n-1)) + (4*exp(.8*time(1,n-1))) - .5*y(1,n-1);
end

plot(time,y);


end