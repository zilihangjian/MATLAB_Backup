function [V1] = HW05_problem02(dx, tolerance, lamda,L)
%function [V1] = HW05_problem02(dx, tolerance, lamda)
%Inputs: dx, the time step for the function's relaxation method. tolerance,
%the threshold for the relaxation method to find roots. lamda, the charge
%distribution along the x axis for the rod. L, the length of the rod from
%-L to L
%Outputs: V1, the Potential in the y and z direction 
%Description: This function plots the field associated with the potential
%of a line charge 2L situated on the x axis
close all; clc;

if nargin < 4
    L = 5;
    lamda = 10;
    dx =.2;
    tolerance = 1E-5;
end

%Variable Declaration
rho = zeros(4*L,4*L,4*L);%Grid Area
for i = (2*L - L):(2*L + L)
    rho(i,2*L,2*L) = (lamda/dx^3); %Line charge distribution along the x axis
end
V = zeros(4*L,4*L,4*L);
[V1, dV]=pointCharge(V, rho, dx);

%Relaxation Method 
c = 1;
while (dV > tolerance * size(V,2)^3) || (c < 2*L)
    [V1, dV] = pointCharge(V1,rho, dx);
    c = c + 1;
end;
%Plot
slice = V1(:, :, 2*L);
figure(); surf(slice);
title('Line Charge Potential');
end


function [vNew, dvNew] = pointCharge(V, rho, dx)
%function [vNew, dvNew] = pointCharge(V, rho, dx)
%Inputs: rho,charge density function of position, dx, V, matrix containing the
%voltage values of the system, dx, step for grid
%Description: Function solves Poissons Equations using relaxation method
%Outputs: vNew, matrix that contains the newly derived values from Poissons
%equations and dvNew which indicates how the matrices have changed and the
%amount changed for each element

%Variable Declaration
x = size(V,1); y = size(V,2); z = size(V,3);
vNew=zeros(x, y, z);
dvNew=0;
for k=2:z-1;
    for j =2:y-1;
        for i=2:x -1;
            vNew(i,j,k) = (V(i-1,j,k) + V(i+1,j,k) + V(i,j+1,k) + ...
            V(i,j-1,k) + V(i,j,k+1) + V(i,j,k-1))/6 + rho(i,j,k)*dx^2/6 ;
            dvNew = dvNew + abs(vNew(i,j,k) - V(i,j,k));
        end
    end
end

end