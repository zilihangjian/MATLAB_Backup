%Bungee script
m = 60;
g = 9.8;
cd = .3;
%t = input('Input time of bungee: ');
t = linspace(0,10);
vt = sqrt(g*m/cd)*tanh(sqrt((g*cd)/m)*t);
plot(vt);
disp(vt);


