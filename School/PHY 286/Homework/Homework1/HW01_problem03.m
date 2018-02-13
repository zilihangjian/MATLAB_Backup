function [nth_digit] = HW01_problem03(n)
% function [nth_digit] = HW01_problem03(n)
% inputs - a scalar integer n that controls how long the sequence is
% outputs - a scalar integer that is the nth entry of that sequence
% Determines the nth entry in the fibonacci sequence and returns that value
clc;
%Initialization
sequence = [1,n];
sequence(1,1) = 1;%First Two Digits in the sequence
sequence(1,2) = 1;

for i=3:n
    sequence(1,i) = sequence(1,i-1) + sequence(1,i-2);
end

nth_digit = sequence(1,n);
end

