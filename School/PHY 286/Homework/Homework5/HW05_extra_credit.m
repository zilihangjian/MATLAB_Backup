function [time, alphas] = HW05_extra_credit(q0,tolerance,alphamin,alphamax,dx1,dx2)
%function [] = HW05_extra_credit(q0,tolerance,alphamin,alphamax,dx1,dx2)
%Inputs q0: charge value in Coulombs, tolerance: used for thresholding the
%values in the relaxation method for determining convergence, alphamin:
%minimum alpha value used in the SOR relaxation method, alphamax: maximum alpha
%value used in the SOR relaxation method, dx1: first value used as the step
%for the x value, dx2: second value used as the step for the x value 
%Outputs time: cell array containing all the time matrices, alphas: vector
%containing all the alpha values for the plotting
%Description: Plots the alpha values compared to the time for converged to
%see how the dx and L values impact the time for convergence under
%different conditions
close all; clc;
if nargin < 6 %default values if the function arguments are not complete
    q0 = 8.85E-12;
    tolerance = 1E-5;
    alphamin = 1;
    alphamax = 2;
    dx1 = .5;
    dx2 = .25;
end

%Matrix Declaration
alphas = linspace(alphamin,alphamax,50);
time1 = zeros(length(alphas));
time2 = zeros(length(alphas));
time3 = zeros(length(alphas));
time4 = zeros(length(alphas));

L1 = [1 2];
dx = [dx1 dx2];
figure();
for j=1: length(alphas)
    time1(j) = pointCharge(q0,L1(1),dx(1),tolerance,alphas(j));
    time2(j) = pointCharge(q0,L1(2),dx(2),tolerance,alphas(j));
    time3(j) = pointCharge(q0,L1(1),dx(2),tolerance,alphas(j));
    time4(j) = pointCharge(q0,L1(2),dx(1),tolerance,alphas(j));
end
subplot(1,4,1); plot(alphas,time1); xlabel('alpha'); ylabel('time');
title(sprintf('alpha %2.0d , dx: %2.2f',L1(1),dx(1)));
subplot(1,4,2); plot(alphas,time2); xlabel('alpha'); ylabel('time');
title(sprintf('alpha %2.0d , dx: %2.2f',L1(2),dx(2)));
subplot(1,4,3); plot(alphas,time3); xlabel('alpha'); ylabel('time');
title(sprintf('alpha %2.0d , dx: %2.2f',L1(1),dx(2)));
subplot(1,4,4); plot(alphas,time4); xlabel('alpha'); ylabel('time');
title(sprintf('alpha %2.0d , dx: %2.2f',L1(2),dx(1)));
time = {time1,time2,time3,time4};

end
function [time] = pointCharge(q0, L, dx, alpha, tolerance)
%function [time] = pointCharge(q0, L, dx, alpha, tolerance)

%Variable Declaration
epsilon0 = 8.85E-12; % lets use SI units ... 
x1 = linspace(-L/2, L/2, round(L/dx));
L1 = length(x1);
Vxy = zeros(L1, L1, L1); %L1 rows and L1 cols for the full grid
Vxy_temp = zeros(L1, L1, L1);
rho= zeros(L1, L1, L1);
inds = find(x1 >= 0);
rho(inds(1),inds(1), inds(1)) = q0/(dx^3*epsilon0); 
iter = 1; converged = false;
tic;
while iter < power(numel(Vxy), 1/3)  || ~converged
	converged = 0;
	Vxy_temp = Vxy;
    %Uses the Gauss-Sidel method 
	for j = 2: L1-1
		for i = 2: L1-1
			for k = 2: L1-1
				Vxy(i,j,k) = (Vxy(i-1, j,k) + Vxy(i+1, j,k)...
                + Vxy(i, j+1,k) + Vxy(i, j-1, k) + ...
                Vxy(i, j, k+1) + Vxy(i, j, k-1)  + ...
                (rho(i,j, k)*(dx^2)))/6; 
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
time = toc;
end