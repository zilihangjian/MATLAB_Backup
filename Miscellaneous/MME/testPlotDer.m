clc; close all; clear;
f = inline('x.^2 + x -10','x');
h = 0.1;
n = 1;
x = -2:0.1:2;
figure()
y = x.^2 + x - 10;
z = 2*x + 1;
hold on
for i = 1: length(x)
    central = (f(x(i)+h) - f(x(i)-h))./(2*h);
    forward = (f(x(i)+h) - f(x(i)))/h;
    backward = (f(x(i)) - f(x(i)-h))/h; 
    plot(x(i), central,'ro');
    plot(x(i), forward, 'g.');
    plot(x(i), backward, 'bx');
end
plot(x,y)
plot(x,z,'k');
legend('Central', 'Forward', 'Backward');
xlabel('x');
ylabel('y');
title('Derivative Approixmation for Arbitrary Function')
