%Fractals Project

clear; clc;
seed = 20;
length = 1000;
x = linspace(-1, 1, length);
y = linspace(-1.5, 1.5, length);
[X,Y] = meshgrid(x,y);
Z = zeros(length);
z0 = 2*X + 1i*Y;
for n=1:seed
   Z = Z.^4 + z0; 
   Q = abs(exp(Z));
end
colormap('summer');
pcolor(Q);
shading flat;
axis('square','equal','off');
