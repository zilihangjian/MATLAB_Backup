%For the Line Charge in Example 5.8, Calculate the quiver plot in the x,y
%plane compared to the x,z plane with a range of -50<=x and y<=50 mm with 
%a step size of 10 mm
clc; clear;
global x0 y0 z0;
global lambda epsilon0;
lambda = 2e-9;
epsilon0 = 8.85e-12;
%The change from the x-z plane to x-y plane means z will always be zero
z0 = 0;
[X,Y] = meshgrid(-50e-3:10e-3:50e-3,-50e-3:10e-3:50e-3);
for i=1:length(X(:,1))
    for j=1:length(Y(:,1))
        x0 = X(i,j);
        y0 = Y(i,j);
        if [x0,y0] == [0,0]
            Ex(i,j) = NaN;
            Ey(i,j) = NaN;
        else 
            Ex(i,j) = quad(@linecharge_Ex,-10,10);
            Ey(i,j) = quad(@linecharge_Ey,-10,10);
        end
        
    end
end

%Quiver Plot
quiver(X, Y, Ex, Ey);
title('E-field');
xlabel('x-axis');
ylabel('y-axis');        