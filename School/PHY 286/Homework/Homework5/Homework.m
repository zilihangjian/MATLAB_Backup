function [] = Homework(q0,dx,tolerance)
close all;

%Variable Declaration
rho = zeros(20,20,20); % Create box to contain charge
V_matrix=zeros(20,20,20);% Create Potential matrix
[V_new, delta_V_new]=pointCharge(V_matrix, rho, dx);

loops=1;
%Relaxation Method 
while delta_V_new > tolerance * size(V_matrix,2)^3 || loops < 20
    loops = loops + 1;
    [V_new, delta_V_new] = pointCharge(V_new,rho, dx);
end;

% Visualise result by taking a slice half way up the cube.
slice = V_new(:, :, 10);
figure();
surf(slice);
title('Potential');
view(3); axis on; grid on;
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

