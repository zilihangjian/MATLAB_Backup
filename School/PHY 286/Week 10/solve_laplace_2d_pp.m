function [Vxy, Ex] = solve_laplace_2d_pp(Vl, Vr, xl, xr, yb, yt, dx, TOL)
% function [Vxyz] = solve_laplace_2d_pp(Vl, Vr, xl, xr, yb, yt, dx)
% 
% Solve Laplace's equation (EnM) for a 2D cartesian geometry of two metal plates 
% at xl held at Vl and xr held at Vr
% yb and yt are bottom and top values of y (which is insulated but has finite conductance)
% dx is the grid spacing
% 
% Return Vxy, a 2D matrix of the potential evaluated at all points made up by the 
% grid -1 1 -1 1 -1 1 0 1 

x = [xl:dx:xr];
y = [yb:dx:yt];
Lx = length(x);
Ly = length(y);

Vxy = zeros(Ly, Lx);
Vxy_temp = zeros(Ly, Lx);

% set boundary conditions
Vxy(:,1) = Vl;
Vxy(:,Lx) = Vr;
Vxy(1,:) = linspace(Vl, Vr, Lx);
Vxy(Ly,:) = linspace(Vl, Vr, Lx);

if ~exist('TOL', 'var')
	TOL = mean(abs([Vl Vr]))/1E4; % set a tolerance
elseif isempty(TOL)
	TOL = mean(abs([Vl Vr]))/1E4; % set a tolerance
end

iter = 1; 
converged = 0;

while (iter<10 || ~converged)
	converged = 0;
	Vxy_temp = Vxy;
	for nx=2:Lx-1
		for ny=2:Ly-1
			Vxy(ny,nx) = (Vxy_temp(ny-1, nx) + Vxy_temp(ny+1, nx) + ...
                Vxy_temp(ny, nx+1) + Vxy_temp(ny, nx-1) )./4;
		end
	end
	deltaV = sum(sum(abs(Vxy_temp-Vxy)));
	if deltaV < Lx*Ly*TOL
		converged = 1;
	end
	iter = iter+1;
end

disp(sprintf('reached convergence in %d iterations', iter-1));

%compute the E-field
Ex = zeros(size(Vxy));
for ny=1:Ly
	for nx=2:Lx-1
		Ex(ny, nx) = -(Vxy(ny,nx+1)-Vxy(ny,nx-1))./(2*dx);
	end
	Ex(ny, 1) = -(Vxy(ny,2)-Vxy(ny,1))./dx;
	Ex(ny, Lx) = -(Vxy(ny,Lx)-Vxy(ny,Lx-1))./dx;
end

% Plot the data 
figure(1);
contour(x, y, Vxy, 30); colorbar;
set(gca, 'Fontsize', 15);
title('V(x,y) equipotential lines');
xlabel('x'); ylabel('y');

figure(2);
quiver(x, y, Ex, zeros(size(Ex)));
set(gca, 'Fontsize', 15);
title('E_x electric field vectors');
xlabel('x'); ylabel('y');
end