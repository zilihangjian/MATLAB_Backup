%Project 2.7
clc; clear all;clear;
R = 100; L = 1e-3; C = 1e-6;
initial_t1 = 10e-6;
t50 = zeros(50,1);
for n=1:50
    t50(n,1) = initial_t1;
    initial_t1 = initial_t1 + 10e-6;
end

initial_t2 = 1e-6;
t500 = zeros(500,1);
for k=1:500
    t500(k,1) = initial_t2;
    initial_t2 = initial_t2 + 1e-6;
end
v0 = 6;%Case1-3 Voltage
i1 = .25;%Case 1
i2 = -.25;%Case 2
i3 = 0;%Case 3

ABexpr1 = ((sqrt(L*C))/(2*R*C));%Z
ABexpr2 = sqrt((ABexpr1^2)-1);%b
ABexpr3 = sqrt(1/(L*C));%w

hold on;
A1 = .5*(v0+(((i1/(ABexpr3*C))+(ABexpr1*v0))*1/ABexpr2));
B1 = .5*(v0-(((i1/(ABexpr3*C))+(ABexpr1*v0))*1/ABexpr2));
v1p = zeros(500,1);
v1t = zeros(50,1);

syms t;
va1 = A1*exp((-ABexpr1*ABexpr3+ABexpr3*sqrt(ABexpr1^2-1))*t);
vb1 = B1*exp((-ABexpr1*ABexpr3-ABexpr3*sqrt(ABexpr1^2-1))*t);

for k=1:500
    vtemp1 = subs(va1,t,t500(k,1));
    vtemp2 = subs(vb1,t,t500(k,1));
    v1p(k,1) = real(vtemp1 +vtemp2);
end
plot(v1p,'k');
 
%Part 2
A2 = .5*(v0+(((i2/(ABexpr3*C))+(ABexpr1*v0))*1/ABexpr2));
B2 = .5*(v0-(((i2/(ABexpr3*C))+(ABexpr1*v0))*1/ABexpr2));
v2p = zeros(500,1);
v2t = zeros(50,1);

va2 = A2*exp((-ABexpr1*ABexpr3+ABexpr3*sqrt(ABexpr1^2-1))*t);
vb2 = B2*exp((-ABexpr1*ABexpr3-ABexpr3*sqrt(ABexpr1^2-1))*t);

for k=1:500
    vtemp1 = subs(va2,t,t500(k,1));
    vtemp2 = subs(vb2,t,t500(k,1));
    v2p(k,1) = real(vtemp1 +vtemp2);
end
plot(v2p,'y');

%Part 3
A3 = .5*(v0+(((i3/(ABexpr3*C))+(ABexpr1*v0))*1/ABexpr2));
B3 = .5*(v0-(((i3/(ABexpr3*C))+(ABexpr1*v0))*1/ABexpr2));
v3p = zeros(500,1);
v3t = zeros(50,1);

va3 = A3*exp((-ABexpr1*ABexpr3+ABexpr3*sqrt(ABexpr1^2-1))*t);
vb3 = B3*exp((-ABexpr1*ABexpr3-ABexpr3*sqrt(ABexpr1^2-1))*t);

for k=1:500
    vtemp1 = subs(va3,t,t500(k,1));
    vtemp2 = subs(vb3,t,t500(k,1));
    v3p(k,1) = real(vtemp1 +vtemp2);
end
plot(v3p,'c');
legend('i1:.25','i2:-.25','i3:0');
xlabel('Time');
ylabel('Voltage');

j=0;
k=0;
while k < 500
   k = k + 10;
   j = j + 1;
   v1t(j,1) = v1p(k,1);
   v2t(j,1) = v2p(k,1);
   v3t(j,1) = v3p(k,1);
end
table = table(v1t,v2t,v3t,t50);
disp(table);
