function [t,V] = sqwave(n,T,i)
%SQWAVE Summary of this function goes here
%   Detailed explanation goes here
% n = number of terms in the fourier series
% T = the period of the square wave in seconds
% i = number of samples per period


%Generate time points
t = [1,i];
initial = T/i;
for g=1:i
    t(1,g) = g*initial;
end

%Generate series
fourier = 0;
syms q;
k = 1;
term_count = 0;
while term_count < n
    fourier = fourier + (4/(pi*k))*sin((2*pi*k*q)/T);
    term_count = term_count + 1;
    k = k + 2;
end

%Generate Series values

V = [1,i];
for y=1:i
   V(1,y) = subs(fourier, q, t(1,y)); 
end

figure();
plot(t,V);
title('Fourier Squarewave Approximation');
xlabel('time');
ylabel('voltage');

if n == 100
   for h=1:i
       if mod(h,20) == 0
       fprintf('   Time  |   Voltage   \n');
       fprintf('-----------------------\n');
       fprintf('%.7f    %1.6f       \n',t(1,h), V(1,h));
       fprintf('-----------------------\n');
       end
   end
end