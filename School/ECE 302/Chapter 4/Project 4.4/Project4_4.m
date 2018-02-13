%Project 4.4
clc; clear;
close all;
%Variable Declarations
L = 1.0e-3;
C = 1.0e-6;
i0 = .25;
v0 = 6;
R = 4*(sqrt((L/(4*C))));
sqroot = sqrt((1/(L*C)) - (1/(2*R*C)).^2);
B = (((v0/L)+(i0/(2*R*C)))/(sqroot));
iL = @(t) exp((-1/(2.*R*C)).*t).*((i0.*cos(sqroot.*t)+... 
B.*sin(sqroot.*t)));
func = @(t)(exp((-1/(2.*R*C)).*t).*((i0.*cos(sqroot.*t)+... 
B.*sin(sqroot.*t))));
bound1 = @(t) (.1*i0);
bound2 = @(t) (-.1*i0);

%Graphing
figure();
t = 0:5e-6:1000e-6; 
hold on;
fplot(func,[0,1000e-6]);
fplot(bound1,[0,1000e-6], 'r');
fplot(bound2, [0,1000e-6], 'r');
xlabel('time');
ylabel('current');
title('i(L) versus t');

%Part 2
new_func = @(t) abs(exp((-1/(2.*R*C)).*t).*((i0.*cos(sqroot.*t)+... 
B.*sin(sqroot.*t)))) - (.1*i0);
p = fzero(new_func,.00035);
yt = func(p);
fprintf('Settling time: %1.9f\n',p);
plot(p,func(p),'go');
placement = +2;
text((p),(yt*placement),['(' num2str(p) ',' num2str(yt) ')']);

%Part 3 Search Method
length = 1000e-6/5e-6;
time = zeros(1,length);
initial = 5e-6;
for k=1:length
    time(1,k) = initial*k;
end

for k=1:length-1
    t1 = time(1,k);
    t2 = time(1,k+1);
    value1 = new_func(t1);
    value2 = new_func(t2);
    if (value1*value2) < 0 
        fprintf('Interval: %9.9f and %9.9f\n',value1,value2);
    end
end
