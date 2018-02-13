%Problem 3 Part 2
clc; clear;
global x0 y0 z0;
global lambda epsilon0;
lambda = 4e-9;%new value of density 
epsilon0 = 8.85e-12;
L = 10e-3;%length of wire
z0 = L/2;
[X,Y] = meshgrid(-50e-3:10e-3:50e-3,-50e-3:10e-3:50e-3);
for i=1:length(X(:,1))
    for j=1:length(Y(:,1))
        x0 = X(i,j);
        y0 = Y(i,j);
        if x0 == 0 && abs(y0)<=L%must be less than wire length
            Ex(i,j) = NaN;
            Ey(i,j) = NaN;
        else 
            Ex(i,j) = quad(@linecharge_Ex,-L/2,L/2);%Represents wire length
            Ey(i,j) = quad(@linecharge_Ey,-L/2,L/2);
        end
    end
end

figure();
quiver(X, Y, Ex, Ey);
title('E-field Part 2');
xlabel('x-axis');
ylabel('y-axis'); 