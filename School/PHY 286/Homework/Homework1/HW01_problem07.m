function [primes] = HW01_problem07(n)
%function [primes] = HW01_problem07(n)
% Input -  integer n that is used a the sequence the first n prime numbers
% Output - a vector matrix that contains the first n prime numbers
% This program calculates the first n prime numbers 
clc;
%Variable Declaration
primes = [1,n];%Stores the prime values
index = 2;%Starts with with two because 1 is excluded
counter = 1;%Stops the while once n values have been added
while counter <= n
    prime_check = HW01_problem06(index);
    if prime_check
        primes(1,counter) = index;
        counter = counter + 1;
    end
    index = index + 1;
end
% disp(primes);
end

