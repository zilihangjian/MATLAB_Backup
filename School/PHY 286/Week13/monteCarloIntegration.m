function [] = monteCarloIntegration(L,dz,x,I0)
rng('shuffle');
if ~exist('Nrand','var')
    Nrand = 1E6;
end

mu0 = 4*pi*1E-7;
z = [-L/2:dz:L/2];
Bx = zeros(size(x));
Bmc = zeros(size(x));
for n1=1:length(Bx)
    zr =-L/2 + L*rand(1,Nrand);
    x0 = x(n1);
    dB = mu0.*I0.*x0(n1)./(4*pi.*(sqrt(x0(n1).^2 + z.^2).^3));
    Bx(n1) = dz.*trapz(dB);
    Bmc(n1) = L.*sum(eval_fun(I0,mu0,x0,zr))/Nrand;
end

plot(x, Bx, 'o', x, Bmc, '*', x, mu0.*I0./(2.*pi.*x), '-k');
legend('Bx:trapz', 'BzLMC', 'Infinite wire');
end

function dB = eval_fun(I0,mu0,x0,z)
    dB = mu0.*I0./(4*pi.*(sqrt(x0.^2 + z.^2).^3)); 
end