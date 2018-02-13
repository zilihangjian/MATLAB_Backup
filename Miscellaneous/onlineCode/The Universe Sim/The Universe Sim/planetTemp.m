function [temp] = planetTemp(d,suntemp,atm,sunr,albedo)


suntemp = suntemp + 273;
A = 4*pi*(sunr^2);
SBC = 5.670367e-8;
L = A*(suntemp^4)*SBC;

a = L*(1-albedo);
b = 16*SBC*pi;
c = (a/b).^(1/4);
d = 1/(d.^(1/2));
temp = (c*d);


if atm == 0
temp = temp - 273;
else
temp = ((temp-273)*atm)/5;
end

end