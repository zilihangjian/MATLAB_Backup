x = [0:.001*pi:2*pi];
y = ((cos(x)).^2.*sin(x)+2.*cos(x)-6.*sin(x))-4;
z = 0;
plot(x,y,'r',x,z,'b');