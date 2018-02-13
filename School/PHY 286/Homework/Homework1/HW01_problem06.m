function [prime] = HW01_problem06(num)
%function [prime] = HW01_problem06(num)
% Input - an integer to be determined if prime or not
% Output -  a boolean that indicates if prime or not
% Returns true if the input is a prime number, false if not
clc;
%Variable Declaration
prime = false;
for i=2:num-1
    if mod(num,i) == 0%Checks all numbers between 2 and num-1 
        fprintf('%1.0f is not prime\n',num);
        return;
    end
end
fprintf('%1.0f is prime\n',num);
prime = true;
end

