%Problem 3 Part 1
clc; clear;
global x0 y0 z0;
global lambda epsilon0;
lambda = 4e-9;%new Value
epsilon0 = 8.85e-12;
y0 = 0;%Inital Value
L = 10e-3;
[X,Z] = meshgrid(-50e-3:10e-3:50e-3,-50e-3:10e-3:50e-3);%Constraints 
for i=1:length(X(:,1))
    for j=1:length(Z(:,1))
        x0 = X(i,j);
        z0 = Z(i,j);
        if x0 == 0 && abs(z0) < L %Due to wire length, z0 must be less 
            Ex(i,j) = NaN;
            Ez(i,j) = NaN;
        else 
            Ex(i,j) = quad(@linecharge_Ex,-L/2,L/2);%Represents the length
            Ez(i,j) = quad(@linecharge_Ez,-L/2,L/2);%Represents teh length 
        end
    end
end

%Quiver Plot
quiver(X, Z, Ex, Ez);
title('E-field Part 1');
xlabel('x-axis');
ylabel('z-axis');   