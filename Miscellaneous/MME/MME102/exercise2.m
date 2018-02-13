function [area,true_error] = exercise2(dx)
%function [area,true_error] = exercise2(dx)
%Calling function [area,true_error] = exercise2(dx)
%[~,true_error] = exercise2(dx)
%[area,~] = exercise2(dx)
clc;
%Variable Declaration
initial_value = 0;
final_value = 6*pi - dx;

%Anonymous Functions for True Value and Function
true_value_approx= @(x) ((2.*x - ((500/29).*cos(x/2).*exp(-.2.*x))) - ...
    ((200/29).*sin(x/2).*exp(-.2.*x)));
func_x = @(x) (((exp(-.2.*x).*(10.*sin(x/2))) + 2)); 

%While Loop Setup
i = initial_value;%Index Value for while loop
area = 0;%Area initializaton

while i < final_value
    area = area + ((func_x(i) + func_x(i+dx))/2)*dx;%Numerical Method
    i = i + dx;%Indexing Statement
end

%Error Calculation
true_value = true_value_approx(final_value) - true_value_approx(initial_value);
true_error = abs((true_value - area)/true_value).*100;  
end