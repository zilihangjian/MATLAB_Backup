function root = bisection(xl,xu,es,maxit)
% function root=bisection(func,xl,xu,es,maxit)

g = 9.81;
c = 0.25;
t = 4;
bisectFUNC = @(m)(sqrt((g.*m)./c).*tanh(sqrt((g.*c)./m).*t)) - 36; 
% if (bisectFUNC(xl)*bisectFUNC(xu)) > 0
%     error('no bracket')
% end
% 
% if nargin < 5
%     maxit = 50;
% end
% 
% if nargin < 4
%     es=.001;
% end

iter = 0;
xr = xl;

while (1)
    xrold = xr;
    xr = (xl + xu)/2;
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr -  xrold)/xr)*100;
    end
    
    test = bisectFUNC(xl)*bisectFUNC(xr);
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit
        break;
    end
end
root = xr;
disp(iter)
end