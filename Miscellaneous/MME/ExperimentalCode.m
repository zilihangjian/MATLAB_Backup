func = @(x) 5.4*x.^4 -0.12*x.^3 + 2*x.^2 - 0.5*x + 1.7; 
x=linspace(0,0.50,3);
h=x(2)-x(1);

for j = 1: length(x)
    
end
xCentral=x(2:end-1);
dFCenteral=(func(3:end)-func(1:end-2))/(2*h);
xForward=x(1:end-1);
dFForward=(func(2:end)-func(1:end-1))/h;
xBackward=x(2:end);
dFBackward=(func(2:end)-func(1:end-1))/h;

figure()
plot(xCentral,dFCenteral,'r')
hold on
plot(xForward,dFForward,'k');
plot(xBackward,dFBackward,'g');
legend('Analytic','Central','Forward','Backward')