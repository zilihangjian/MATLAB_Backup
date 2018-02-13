%test1 
clc;
clear all;
close all;
x = 0:0.1:10;
y = 2* exp(-.2*x);

x1 = 0:0.1:10;
y1 = pi*cos(abs(exp(x)));
plot(x,y,'r',x1,y1,'b');
xlabel('x');
ylabel('y');
title('Title');
grid;
legend('2*exp(-.2*x)','pi*cos(abs(exp(x)))');

u = 1;
v = 3;

disp(4*u/3*v);
disp((2*v^-1)/((u+v)^2));
disp((v^3)/(v^3-u^3));
disp((4/3)*pi*v^2);

% pwd
% 
% mkdir('Lab1','mynewdir');
% cd('mynewdir');

