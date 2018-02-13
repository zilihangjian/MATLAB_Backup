m = 100;
k = 3000;
c = 300;
V0 = 0;
x0 = 0.10;
t = 0:0.01:10;

Wn = sqrt(k/m)

Ccr = 2*sqrt(k*m)

Z = c /Ccr

Wd = Wn*sqrt(1-(Z^2))
A = (1/Wd)*sqrt(((V0+(Z*Wn*x0))^2) + ((x0*Wd)^2))

Phi = atan((x0*Wd) / (V0+(Z*Wn*x0)))
x1 = A*exp(-1*Z*Wn.*t);
x2 = (sin((Wd.*t)+Phi));
x = ones(1,length(t));
for j = 1: length(t)
    x(j) = A*exp(-1*Z*Wn.*t(j))*(sin((Wd.*t(j))+Phi));
end
% xTemp(t) = A*exp(-1*Z*Wn.*t).*(sin((Wd.*t)+Phi))

plot(t,x);

xlabel('seconds');
ylabel('displacement');

