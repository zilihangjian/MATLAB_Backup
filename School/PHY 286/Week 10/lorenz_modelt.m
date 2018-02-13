function[x,y,z,t] = lorenz_modelt(x0,y0,z0,sigma, r, b, deltat, tmax)
%x0 = 1, y0 = 0, z0 = 0 and x0 = 0, y0 = 0, z0 = 1 
%sigma = 10 
%b = 8/3
%r = 25
%
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
for n = 1 : (tmax/deltat)
    if x(n) > 0 && x(n+1) < 0 || x(n) < 0 && x(n+1) > 0
       x1 = x(n);
       x2 = x(n+1);
       m = (x2-x1)/deltat;
       if (-x1/m) - (deltat/2) >= 0 
           a(i) = n+1;
       else
           a(i) = n;
       end
       i = i+1;
    end
end

fprintf('there are %.0f point with x values of zero\n', length(a));
plot(y(a),z(a), '.r');
end