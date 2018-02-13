%Project 2.7 Beta

%Clear
clear;
clc;

%Variable Declarations
R = 100;
L = 1e-3;
C = 1e-6;
i_curr = [1,3];
i_curr(1,1) = .25; %Case 1 current
i_curr(1,2) = -.25; %Case 2 current
i_curr(1,3) = 0; %Case 3 current
v0 = 6; %Case 1-3 voltage 
time = 0:10e-6:500e-6;
size(time)
Voltage = [1,51];
syms A_temp; 
syms B_temp; 
syms t;

for n=1:3
   dv0 = ((-1/(R*C))*v0) - ((1/C)*i_curr(1,n));%derivative of v
   solution = [v0,dv0];
   expr1 = (1/(2*R*C));%5000
   expr2 = (1/(L*C));%1e9
   expr3 = sqrt(expr2 - expr1.^2);%3.1225e+04
   vt = exp(-expr1.*t).*((A_temp.*exp(sqrt(expr3)*t)) + ...
   (B_temp.*sin(sqrt(expr3).*t)));
   dv = diff(vt);
   C = subs(vt,t,0);%A is always equal to vc
   A = v0;
   vt = subs(vt,A_temp,A);
   dv = subs(vt,A_temp,A);
   
   B = subs(B,t,0);
   disp(B);
   V = exp(-expr1.*time).*((A.*cos(sqrt(expr3)*time)) + ...
   (B.*sin(sqrt(expr3).*time)));
   plot();
end