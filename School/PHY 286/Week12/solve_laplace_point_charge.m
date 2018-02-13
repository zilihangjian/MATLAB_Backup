function [Vxy, Ex, Ey] = solve_laplace_point_charge(q0, L, dx, alpha, TOL)

% function [Vxy, Ex, Ey] = solve_laplace_point_charge(q0, L, dx, TOL)
% 
% solve Laplaces equation for a point charge (at the the origin) in 2D
% q0 = charge in C
% L is "length" of the grid for seeking solutions
% dx = dy: the grid spacing
% Return:
% Vxy, a 2D matrix of the potential evaluated at all points inside the grid
% Ex: the x-direction field
% Ey: the y-direction field

if ~exist('TOL', 'var')
	TOL = 1E-5;
	% make it dependent on the the voltage inputs + the grid size
elseif isempty(TOL)
	TOL = 1E-5;
end

epsilon0 = 8.85E-12; % lets use SI units ... 

x1 = linspace(-L/2, L/2, round(L/dx));
L1 = length(x1);
Vxy = zeros(L1, L1, L1); %L1 rows and L1 cols for the full grid
Vxy_temp = zeros(L1, L1, L1);

rho= zeros(L1, L1, L1);

inds = find(x1 >= 0);
rho(inds(1),inds(1), inds(1)) = q0/(dx^3*epsilon0); 

iter = 1; 
converged = 0;

tic;
while (iter<power(prod(size(Vxy)), 1/3)  || ~converged)
	converged = 0;
	Vxy_temp = Vxy;
	for nx=2:L1-1
		for ny=2:L1-1
			for nz=2:L1-1
				Vxy(ny,nx,nz) = (Vxy(ny-1, nx,nz) + Vxy(ny+1, nx,nz) + Vxy(ny, nx+1,nz) + Vxy(ny, nx-1, nz) + Vxy(ny, nx, nz+1) + Vxy(ny, nx, nz-1)  + (rho(ny,nx, nz)*(dx^2)))/6; % calculate using the gauss-sidel method, instead of the Jacobi
			end
		end
	end
	deltaV = Vxy - Vxy_temp;
	Vxy = alpha.*deltaV + Vxy_temp;
	if sum(abs(deltaV(:))) < L1*L1*L1*TOL
		converged = 1;
	end
	iter = iter+1;
end

disp(sprintf('reached convergence for a grid size of (%dx%dx%d = %d grid elements) with %d iterations in %0.3f s', L1, L1, L1, L1^3, iter-1, toc));

%compute the E-field
figure(1); 
plot(x1(inds), Vxy(inds(1), inds, inds(1)), 'ob', x1(inds), q0./(4*pi*epsilon0*x1(inds)), '--k');
set(gca, 'Fontsize', 15);
title('V(x,0, 0) ');
xlabel('x [m]'); ylabel('V(x)');
