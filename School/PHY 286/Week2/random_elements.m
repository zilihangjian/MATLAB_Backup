%100 element vector contianing random values between 0 and 1, find all
%elements less than .5
clc;
tic;
x = rand(1000000000,1); %random 100 element vector
values = zeros(1000000000,1);
for i=1:length(x)
    if x(i,1) < .5 && x(i,1) <.4
        %fprintf('Index: %1.0f and Value: %1.5f\n',i,x(i,1));
        %values(i,1) = x(i,1);
    end
    
end
toc;

tic;
indes = find(x<.5 & x <.4);
toc;
%The way this works is that x>.4 returns a vector (size x) with logical
%elements 1 where this condition is true and 0 ad false;
%x<.5 returns a vecotr (size x) with logical elements whetre this condition
%is true and 0 where false 
% The & performs a logical and function on these, ad finds returns the
% indeices of the 1s