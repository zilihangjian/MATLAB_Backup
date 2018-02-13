function [] = MagneticFieldWire(L,dz,x,I0)

mu0 = 4.*pi.*1E-7;
z = [-L/2:dz:L/2];
Bx = zeros(size(x));
for n1=1: length(Bx)
    x0 = x(n1);
    dB = mu0.*I0.*x0./(4*pi.*(sqrt(x0.^2 + z.^2).^3));
    Bx(n1) = dz.*trapz(dB);
end


end