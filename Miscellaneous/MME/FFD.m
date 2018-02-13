clc; clear; close all;
func = @(x) 5.4*x.^4 -0.12*x.^3 + 2*x.^2 - 0.5*x + 1.7; 
x = 0.50;
h = 0.25;
cpdApprox = (func(x+h) - func(x-h))/(2*h);
ffdApprox = (func(x+h) - func(x)/(h));
bfdApprox = (func(x) - func(x-h)/(h));
syms t;
expression = 5.4*t.^4 -0.12*t.^3 + 2*t.^2 - 0.5*t + 1.7; 
dexpression = diff(expression);
trueApprox = vpa(subs(dexpression, 0.50));

%Taylor Series Approximation
syms n
f1 = log(n);
f2 = sin(n);
f3 = 4*n.^4 + 3*n.^3 + 2*n.^2 + n + 8;

tay1 = taylor(f1, n, 'ExpansionPoint', 2, 'Order', 10);
disp(tay1)
tay2 = taylor(f2, n, 'ExpansionPoint', 2, 'Order', 10);
disp(tay2)
tay3 = taylor(f3, n, 'ExpansionPoint', 2, 'Order', 10);
disp(tay3)


