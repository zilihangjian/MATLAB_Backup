function[Vxy] = HW05_problem01(q0,L,dx,alpha,tolerance)
%function[Vxy] = HW05_problem01(q0,L,dx,alpha,tolerance)
%Inputs - q0, the initial charge for the point charge. L, the length of
%container surronding the point charge. dx, the step for determining the 
%x increment. alpha, the alpha value used in the SOR method to speed up the
%method. tolerance, a value for thresholding when a root has been
%determined.
%Outputs, Vxy, the voltage based on the sphereical coordinates based point
%charge
%Description: This program uses the SOR method to determine the characters
%of a potential of a point charge using sphereical coordinates and then
%plots the values compared to Coulomb's Law
close all; clc;

if nargin < 5
    q0 = 1;
    L = 2;
    dx = .2;
    alpha = 1.5;
    tolerance = 1E-5;
end

%Variable Declaration
epsilon0 = 8.85E-12;
N = 50; step = .5;
[coulombV,d] = coulombGeneration(N,q0,epsilon0,step);
rMinimum = .2;
%Choose a point charge at r = 0, imposing V = 0 some large distance away
% r =  0 at x,y,z = 0

% Relaxation method 
x1 = linspace(-L/2,L/2,round(L/dx));
L1 = length(x1); %Grid Size
Vxy = zeros(L1,L1,L1);
r = zeros(L1,L1,L1);
Vxy_temp = zeros(L1,L1,L1);
rho = zeros(L1,L1,L1);

inds = find(x1 >= 0);
rho(inds(1),inds(1),inds(1)) = q0/(dx^3*epsilon0);

iter = 1;
converged = false;
tic;
while (iter<power(numel(Vxy),1/3) || ~converged)
    converged = 0;
    Vxy_temp = Vxy;
    for i=2:L1-1
        for j=2:L1-1
            for k=2:L1-1
                Vxy(i,j,k) = (Vxy(i-1,j,k) + Vxy(i+1,j,k) + Vxy(i,j+1,k)...
                + Vxy(i,j-1,k) + Vxy(i,j,k+1) + Vxy(i,j,k-1) + ...
                (rho(i,j,k)*(dx^2)))/6;
                r(i,j,k) = sqrt(i^2 + j^2 + k^2);%Spherical Coordinates
                if r(i,j,k) == 5
                    Vxy(i,j,k) = 0;
                end
            end
        end
    end
    
    deltaV = Vxy - Vxy_temp;
    Vxy = alpha.*deltaV + Vxy_temp;
    
    if sum(abs(deltaV(:))) < L1*L1*L1*tolerance
        converged = true;
    end
    iter = iter + 1;
   
end

fprintf('Converged for grid size of (%d x %d x %d) with %d elements\n',...
    L1,L1,L1,L1^3); 
fprintf('%d iterations in %f seconds\n',iter-1,toc);

figure(1);
%Plot Coulombs Law Version

subplot(1,2,1); plot(d,coulombV,'.r');
xlabel('r'); ylabel('V');title('V vs r');
subplot(1,2,2);
hold on;
% plots each point on the 3D matrix
for i=1:L1
    for j=1:L1
        for k=1:L1
            plot((r(i,j,k)),(Vxy(i,j,k)),'.g');
        end
    end
end

end

function [coulombV,d] = coulombGeneration(N,q0,epsilon0,step)
%function [coulombV] = coulombGeneration(N,q0,epsilon0,step)
d = [1 N];
coulombV = [1 N];
d(1) = 1;
for i=2:N
    d(i) = d(i-1) + step;
    coulombV(i-1) = q0 ./ (4*pi*epsilon0*d(i-1)); 
end
coulombV(i) = q0 ./ (4*pi*epsilon0*d(i)); 

end