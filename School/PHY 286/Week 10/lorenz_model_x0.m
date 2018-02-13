function [yint, zint] = lorenz_model_x0(x0, y0, z0, sigma, r, b, deltat, tmax)

t = [];
x = [];
y = [];
z = [];
t(1) = 0;
x(1) = x0;
y(1) = y0;
z(1) = z0;

for n = 1 : (tmax/deltat)
    t(n+1) = t(n) + deltat;
    x(n+1) = x(n) + deltat*(sigma*(y(n) - x(n)));
    y(n+1) = y(n) + deltat*(-x(n)*z(n) + r*x(n) - y(n));
    z(n+1) = z(n) + deltat*(x(n)*y(n)-b*z(n));
end
a = [];
i = 1;

inds = find(t>30);
t = t(inds);
x = x(inds);
y = y(inds);
z = z(inds);

cxinds = find(abs(diff(sign(x)))); % find where the magnitude of the difference in sign(x) is not zero -- thus x changes sign between cxinds and cxinds+1

fprintf('found %d points where x == 0\n', length(cxinds));

t1 = t(cxinds); 
t2 = t(cxinds + 1); 
x1 = x(cxinds);
x2 = x(cxinds + 1);
tint = (x2.*t1 - x1.*t2)./(x2-x1); %linear interpolation for t where x = 0

y1 = y(cxinds);
y2 = y(cxinds + 1);
z1 = z(cxinds);
z2 = z(cxinds + 1);

yint = y1 + (y2-y1).*(tint-t1)./(t2-t1);
zint = z1 + (z2-z1).*(tint-t1)./(t2-t1);

plot(yint, zint, '.');

end