function [Vxy, Ex, Ey] = solve_laplace_2d_squaretubes(Vout, Vin, L1, L2, dx, TOL)

% function [Vxy, Ex, Ey] = solve_laplace_2d_squaretubes(Vout, Vin, L1, L2, dx, TOL)
% 
% Solve Laplace's equation (EnM) for a 2D cartesian geometry for two square metal tubes
% that are "concentrically" placed (i.e. tube2 is symettrically located inside tube1)
% The outer tube is held at a potential Vout
% The inner tube is held at a potential Vin
% L1 is the length of the outer tube
% L2 is the length of the inner tube (obviously L1 > L2)
% dx is the grid spacing (= dy)
% 
% 
% Return:
% Vxy, a 2D matrix of the potential evaluated at all points made up by the % grid
% Ex: the x-direction field
% Ey: the y-direction field

x1 = linspace(-L1/2, L1/2, round(L1/dx));
y1 = x1;
x2 = linspace(-L2/2, L2/2, round(L2/dx));
y2 = x2;

Lx = length(x1);
Ly = length(y1);
Vxy = zeros(Ly, Lx); %Ly rows and Lx cols for the full grid
Vxy_temp = zeros(Ly, Lx);

% set boundary conditions
Vxy = setBCs(Vxy, x1, x2, y1, y2, Vout, Vin);

if ~exist('TOL', 'var')
	TOL = mean(abs([Vout Vin]))/prod(size(Vxy)); % set a tolerance
	% make it dependent on the the voltage inputs + the grid size
elseif isempty(TOL)
	TOL = mean(abs([Vout Vin]))/prod(size(Vxy)); % set a tolerance
end

iter = 1; 
converged = 0;

tic;
while (iter<sqrt(prod(size(Vxy)))./2  || ~converged)
	converged = 0;
	Vxy_temp = Vxy;
	for nx=2:Lx-1
		for ny=2:Ly-1
			Vxy(ny,nx) = (Vxy_temp(ny-1, nx) + Vxy_temp(ny+1, nx) + Vxy_temp(ny, nx+1) + Vxy_temp(ny, nx-1) )./4; 
			%do the full calculation, though it wastes cycles and produces extra CO2
		end
	end
	Vxy = setBCs(Vxy, x1, x2, y1, y2, Vout, Vin); %just reset the BCs here!
	deltaV = sum(sum(abs(Vxy_temp-Vxy)));
	if deltaV < Lx*Ly*TOL
		converged = 1;
	end
	iter = iter+1;
end

disp(sprintf('reached convergence with %d iterations in %0.3f s', iter-1, toc));

%compute the E-field
Ex = zeros(size(Vxy));
Ey = zeros(size(Vxy));

for ny=2:Ly-1
	for nx=2:Lx-1
		Ex(ny, nx) = -(Vxy(ny,nx+1)-Vxy(ny,nx-1))./(2*dx);
		Ey(ny, nx) = -(Vxy(ny+1,nx)-Vxy(ny-1,nx))./(2*dx);
	end
end

% Plot the data 
figure(1);
contour(x1, y1, Vxy, 10); colorbar;
set(gca, 'Fontsize', 15);
title('V(x,y) equipotential lines');
xlabel('x'); ylabel('y');

figure(2);
quiver(x1, y1, Ex, Ey);
set(gca, 'Fontsize', 15);
title('Electric field vectors');
xlabel('x'); ylabel('y');

% = = = = = = = = = = = = = = = Sub-function(s) = = = = = = = = = = = = = = = 

function Vxy = setBCs(Vxy, x1, x2, y1, y2, Vout, Vin)
% function setBCs(x1, x2, y1, y2, Vout, Vin)
% sets the boundary condition on the grid elements in Vxy
% this is of course for the two (infinitely long) tubes held at two potentials

% Vxy is Vout at the boundaries of x1/y1
% Vxy is Vin at the boundaries of x2/y2

Vxy(:,1) = Vout; %left edge
Vxy(:,length(x1)) = Vout; %right edge
Vxy(1,:) = Vout; %top edge
Vxy(length(y1),:) = Vout; %bottom edge

xinds=find(x1 < x2(1)); 
xinds = [1:length(x2)]+xinds(end); %these are the indices in Vxy that are at Vin
yinds = find(y1<y2(1));
yinds = [1:length(y2)]+yinds(end); %these are the indices in Vxy that are at Vin
Vxy(xinds, yinds) = Vin;
