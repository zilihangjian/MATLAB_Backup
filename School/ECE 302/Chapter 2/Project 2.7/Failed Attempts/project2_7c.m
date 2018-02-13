%Project 2.7c
clc;clear;close all;
time1 = zeros(50,1);
t1 = 0;
for n=1:50
    t1 = t1 + 10e-6;
    time1(n,1) = t1;
end
time2 = zeros(500,1);
t2 = 0;
for k=1:500
    t2 = t2 + 1e-6;
    time2(k,1) = t2;
end
R = 100;
L = 1e-3;
C = 1e-6;
v0 = 6;

case1 = [v0;((-1/(R*C))*v0) - ((1/C)*(.25))];%current =.25

case2 = [v0;((-1/(R*C))*v0) - ((1/C)*(-.25))];%current =-.25

case3 = [v0;((-1/(R*C))*v0)];%current =0

expression1 = (1/(2*R*C));
expression2 = (1/R*C);
expression3 = sqrt(expression1^2 - expression2);
syms t;
vt = exp((-t/(2*R*C)) + (sqrt((1/(2*R*C)^2)) - (1/(L*C)))*t)...
    + exp((-t/(2*R*C)) - (sqrt((1/(2*R*C)^2)) - (1/(L*C)))*t);
dvt = diff(vt);
vt1 = exp((-t/(2*R*C)) + (sqrt(((1/(2*R*C)^2)) - (1/(L*C))))*t);
vt2 = exp((-t/(2*R*C)) - (sqrt(((1/(2*R*C)^2)) - (1/(L*C))))*t);
dvt1 = diff(vt1);
dvt2 = diff(vt2);
VV = [vt1,vt2;dvt1,dvt2];

AB1 = VV\case1;
A1 = subs(AB1(1,1),t,0);
B1 = subs(AB1(2,1),t,0);

AB2 = VV\case2;
A2 = subs(AB2(1,1),t,0);
B2 = subs(AB2(2,1),t,0);

AB3 = VV\case3;
A3 = subs(AB3(1,1),t,0);
B3 = subs(AB3(2,1),t,0);

Voltage1 = zeros(500,1);
Voltage2 = zeros(500,1);
Voltage3 = zeros(500,1);
v1 = A1*exp((-expression1 + expression3)*t)...
+ B1*exp((-expression1 - expression3)*t); 
v2 = A2*exp((-expression1 + expression3)*t)... 
+ B2*exp((-expression1 - expression3)*t);   
v3 = A3*exp((-expression1 + expression3)*t)... 
+ B3*exp((-expression1 - expression3)*t); 

for j=1:500
   Voltage1(j,1) = subs(v1,t,time2(j,1)); 
   Voltage2(j,1) = subs(v2,t,time2(j,1));
   Voltage3(j,1) = subs(v3,t,time2(j,1)); 
end
hold on;
plot(time2,abs(Voltage1), 'r');
plot(time2,abs(Voltage2),'g');
plot(time2,abs(Voltage3),'b');
legend('iL:.25','iL:-.25','iL:0');


