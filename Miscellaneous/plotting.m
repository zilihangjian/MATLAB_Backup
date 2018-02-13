%This MATLAB program is called plotting.m.
clear; clc; close all;
figure();
xmin=-1;
xmax=5;
x=xmin:0.02:xmax;
% The "for loop" that follows defines the family of functions and plots them in one picture.
% a=-6:2:6 means that program will perform the following commands in the loop with
% a=-6, then a=-6+2=-4, then a=-4+2=-2, ...., a=6
% You will alter the y =... line based on your solutions of each differential equation.
for a = -6:2:6
y =(a+2)*exp(-x)-(a+1)*exp(-2*x);
plot(x,y)
grid on
axis([xmin xmax -2 3]) %The numbers in this list are the x and y boundaries for the graph.
hold on
end
xlabel('x'); ylabel('y'); title('Differential Equations Plot');
legend('a = -6','a = -4','a = -2','a = -0','a = 2','a = 4','a = 6');

figure(2);
yprime = diff(y);
a = 1;
b = yprime;

for b = -3:1:3
y =(a+2)*exp(-x)-(a+1)*exp(-2*x);
plot(x,y)
grid on
axis([xmin xmax -2 3]) %The numbers in this list are the x and y boundaries for the graph.
hold on
end
