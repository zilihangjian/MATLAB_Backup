function [y1f,y2f] = HW02_problem02(N,x1,x2)
%function [y1f,y2f] = HW02_problem02(N,x1,x2)
% Inputs - N is the length for iteration for Euler's Method, - x1 is the
% approximation value to be determined, - x2 is the approximation value to
% be determined
% Outputs - y1f is the appoximated output based on the input x1, - y2f us
% tge approximated output based on the input x2
% Description:
% Solve the following problem using Euler's Method
% y' + (pi/2)*sqrt(1 - y^2) = 0 , y(0) = 0,
% Plot the results and return y(x) at x = 15 and x = 20

clc;
%Approximation for x=15 and x=20
stepSize = [x1./N,x2./N];
y1 = zeros(1,N);
y2 = zeros(1,N);
x1 = [0:N]*stepSize(1,1);
x2 = [0:N]*stepSize(1,2);

for i=1:N
    y1(i+1) = y1(i) + stepSize(1,1).*(-((pi/2).*sqrt(1 - y1(i).^2)));
    y2(i+1) = y2(i) + stepSize(1,2).*(-((pi/2)*sqrt(1 - y2(i)^2)));
end

subplot(2,1,1);
y1f = y1(end);
plot(x1,y1,'b');
xlabel('x2');
ylabel('y2');

subplot(2,1,2);
y2f = y2(end);
plot(x2,y2,'g');
xlabel('x2');
ylabel('y2');

end