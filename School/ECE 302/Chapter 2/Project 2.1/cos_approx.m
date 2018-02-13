%Exercise 2.1
%Program Description 
%General Term for Taylor Series of cos(x) =
%((-1)^k)*(x^2*k))/(factorial(2k)
function result = cos_approx(x)
n = 0;% while index
alternating = 1;%eliminates the (-1^n) in the taylor series 
difference = 1;%easier way of checking how close the approx gets, while
% loop will update the difference as the appro approaches the actual value
taylor_approx = 1;%taylor series of cos(x) added in the while loop
taylor_part = 1; %individual terms of approximation
while difference > .000001
    alternating = -alternating;
    n = n + 1;
    taylor_part = ((x^(2*n)))/(factorial(2*n)*alternating);
    taylor_approx = taylor_approx + taylor_part;
    difference = abs(taylor_approx - cos(x));
    if n > 50 
        break
    end
end
tay = taylor_approx;
result = zeros(1,2);
result(1,1) = tay;
result(1,2) = n;