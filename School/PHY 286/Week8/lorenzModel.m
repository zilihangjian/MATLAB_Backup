function [] = lorenzModel(x0,y0,z0,sigma,r,b,deltat,tmax)

x(1) = x0;
y(1) = y0;
z(1) = z0;
t(1) = 0;
count = 1;
while t < tmax
   x(count+1) = x(count) + ((sigma.*(y(count)-x(count))).*deltat);  
   y(count+1) = y(count) + ((-x(count).*z(count)) + (r.*x(count)...
       - y(count))).*deltat;
   z(count+1) = z(count) + ((x(count).*y(count) - (b.*x(count)))).*deltat;
   t(count+1) = t(count) + deltat;
   count = count + 1;   
end

figure(1);
plot(x,z,'k');
xlabel('x');
ylabel('z');

end