function [] = BiotSavart(L,x0,dz)
%function [] = BiotSavart(L)
u0 = (1e-7).* (4.*pi);
I = (4.*pi/u0);
i = -L/2;
B(1) = 0;
x(1) = x0;
z = [-L/2:dz:L/2];
count = 1;

while i < L/2
    B(count+1) = B(count) + (u0.*I./(4.*pi)).*((x(count).*dz)/...
        ((z(count).^2 + x(count).^2))).^1.5;
    i = i + dz;
    z(count+1) = i;
    x(count+1) = sqrt(I.^2 - z(count+1).^2);
    count = count + 1;
end

plot(x,B);






end