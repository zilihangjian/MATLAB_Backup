function [Fn] = HW01_problem04(n)
%function [Fn] = HW01_problem04(n)
% input - a integer n that determines the digit in the fibonacci sequence
% to be calculated
% output - the nth digit of the fibonacci sequence
% This program computes the closed form version of a digit in the fibonacci
% sequence, and then calls a function to calculate the actual value,
% then computes and prints the percent error between the two
clc;
%Variable Declaration
phi = (1+sqrt(5))/2;
ohm = (1-sqrt(5))/2;
Fn = (phi^n - ohm^n)/sqrt(5);
actualValue = HW01_problem03(n);

fprintf('Closed Form: %9.9f\n',Fn);
fprintf('Actual Value: %9.9f\n',actualValue);
PercentError = abs((Fn - actualValue)/actualValue)*100;
fprintf('Percent Error: %1.9g',PercentError);


end