function [y1f,y2f] = HW02_problem01(N,x1,x2)
%function [y1,y2] = HW02_problem01(N,x1,x2)
%Inputs - N, integer used for calculating the step size and determining the
%number of iterations used to approximate the equation. x1 and x2 are two
%values to check for the corresponding y values. x1 should be smaller
%than x2
%Output - The two outputs to the x inputs given by the differential
%equation
%Description - Solves the equation y' = (y-x)^2, y(0) = 0; and plots it

clc;
%Variable Declaration
stepSize = [x1./N, x2./N];
y1 = zeros(1,N);
x1 = [0:N].*stepSize(1,1);
y2 = zeros(1,N);
x2 = [0:N].*stepSize(1,2);

for i=1:N
    y1(i+1) = y1(i) + stepSize(1,1).*(y1(i)-x1(i)).^2;
    y2(i+1) = y2(i) + stepSize(1,2).*(y2(i)-x2(i)).^2;
end

%Plotting
subplot(2,1,1);
y1f = y1(end);
plot(x1,y1,'k');
xlabel('x1');
ylabel('y2');

subplot(2,1,2);
y2f = y2(end);
plot(x2,y2,'r');
xlabel('x2');
ylabel('y2');
end