function [func_root] = newtonRaphson(start,steps,tolerance)
%NEWTONRAPHSON Summary of this function goes here
%   Detailed explanation goes here

%Newton Raphsan
fx = @(x) polyval([3 -5 1 2],x);
count = 1;
error = abs(fx(start));
xprev = start;
while tolerance < error && count <= steps
    func_root= (xprev - fx(xprev)/ (polyval([9 -10 1],xprev)));
    xprev = func_root;
    error = abs(fx(xprev));
    count = count + 1;
end

if count > steps
    fprintf('Error in Starting Step');
    fplot(fx,[-2 2 -2 2],'--k');
else 
    fprintf('Root: %f',func_root);
    fplot(fx,[-2,2,-2,2],'--k');
    text((func_root),(fx(func_root)),['(' num2str(func_root) ',' num2str(fx(func_root)) ')']);
end

end

