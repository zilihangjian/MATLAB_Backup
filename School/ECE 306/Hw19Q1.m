clear
k = -2;
w0 = 2.*pi/2.2;
q = 2.9/2.2;
A = ((.3.*1i)/(k.*w0)).*(exp(-1i.*k.*w0.*.3) + (exp(1i.*k.*w0.*.3)));
B = (1/((k.*w0).^2)).*(exp(-1i.*k.*w0.*.3) - (exp(1i.*k.*w0.*.3)));
Final = q .* (A + B);
