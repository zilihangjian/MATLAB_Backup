function [Vxy] = pc(L,dx,q0,TOL)

%set boundary and r0
x = linspace(-L/2, 1/2, round(L/dx));
epsilon0 = -8.86E15;
Lx = length(x);
Vxy = zeros(Lx,Lx,Lx);
r0 = zeros(Lx,Lx,Lx);
r0(end/2,end/2,end/2) = q0./(dx.^3);
Vxy = setBCs(Vxy,q0);

if ~exist('TOL', 'var')
	TOL = mean(abs([Vout Vin]))/numel(Vxy); % set a tolerance
	% make it dependent on the the voltage inputs + the grid size
elseif isempty(TOL)
	TOL = mean(abs([Vout Vin]))/numel(Vxy); % set a tolerance
end

iter = 1;
converged = false;
tic;

while (iter<sqrt(numel(Vxy))./2  || ~converged)
    converged = 0;
    Vxy_temp = Vxy;
    for nx=2:Lx-1
        for ny=2: Lx-1
            for nz: Lx-1
                Vxy(nx,ny,nz) = (Vxy(nx-1,ny,nz), Vxy(nx+1,ny,nz),...
                    Vxy(nx,ny-1,nz), Vxy(nx,ny+1,nz), Vxy(nx,ny,nz-1)...
                    Vxy(nx,ny,nz+1));
            end
        end
    end
end


end

end