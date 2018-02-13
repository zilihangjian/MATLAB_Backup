clear; clc; close all;
actualValue = ((pi/2) - 1 - 0.50*sin(pi/2));
fprintf('Actual Value of Function | %g\n', actualValue);

%Taylor Series Expansion
absoError = 1;%Arbitrary Error Point
errorGoal = 0.015;

syms t
expression = (t - 1 - 0.50*sin(t));
currentOrder = 1;
while absoError > errorGoal
    tay = taylor(expression, 'Order', currentOrder);
    fprintf('Taylor Series Expansion Order  | %g\n', currentOrder);
    fprintf('Taylor Series Expression\n');
    disp(tay);
    expandedValue = vpa(subs(tay,pi/2));
    fprintf('Taylor Series Expanded Value | %g\n', expandedValue);
    currentOrder = currentOrder  + 1;
    absoError = abs(actualValue - expandedValue);
    fprintf('Absolute Error | %g\n', absoError);
end

