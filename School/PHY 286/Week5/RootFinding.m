%Newton Raphsan

x(1) = 0;
fx = @(x) polyval([3,-5,1,2],x);
epsilon = .00001;
limit = 100;
count = 1;
while x(count) > epsilon && count <= limit
    dfx = (((fx(count) + fx(count+1)) ./ (x(count) + x(count+1));
    x(count+1) = x(count) + fx(count)./dfx;
    count = count + 1;
end
if count > limit
    fprintf('Error in Starting Step');
else 
    root = x(count);
    fprintf('Root: %f',root);
end