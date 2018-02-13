function [fact] = HW01_problem05(num)
%function [fact] = HW01_problem05(num)
% input - an integer to calculate the factorial of
% output - the factorial of the input
% A manual script to calculate the factorial of a number
clc; 
%Variable Declaration
sequence = 1;%Stores the sequence
storage = [1,num];%Storage for all the integers up to n

%Upcounts to the integer and multiples all values up the integer togather
for j=2:num
    storage(1,j) = j;
    sequence = sequence*storage(1,j);
end

if sequence == factorial(num)
    fact = sequence;
end

end

