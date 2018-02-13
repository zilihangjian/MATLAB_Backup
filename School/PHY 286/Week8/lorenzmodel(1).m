function [x, y, z, t] = lorenzmodel(x0, y0, z0, sigma, r, b, deltat, tmax)

x(1) = x0;
y(1) = y0;
z(1) = z0;
time = 0: deltat: tmax;

count = 1;
Nsteps = length(time) - 1;

for n= 1:Nsteps
    x(count + 1) = x(count) + ((sigma.*(y(count) - x(count))).*deltat);
    y(count + 1) = y(count) + ((-x(count).*z(count) + r.*x(count) - y(count)).*deltat);
    z(count + 1) = z(count) + (((x(count).*y(count) - b.*z(count))).*deltat);
    
    count = count + 1;
    
end

figure(1)
hold off
plot(time, z, '--k')
xlabel('Time')
ylabel('Z')

figure(2)
hold off
plot(x, z)
xlabel('X')
ylabel('Z')

figure(3)
hold off
plot(x, z)
xlabel('Z')
ylabel('Y')