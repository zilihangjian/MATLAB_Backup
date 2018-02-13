function [ak] = Hw19Q5(k)
%HW19Q5 Summary of this function goes here
w0 = 2.*pi/1.8;
A = ((4/9).*(-1/(1i.*k.*w0))).*(exp(-1i.*k.*w0.*.3) - exp(1i.*k.*w0.*.3));
B = ((-5/9).*(-1/(1i.*k.*w0))).*(exp(-1i.*k.*w0.*1.5) - exp(-1i.*k.*w0.*.3));
ak = A + B;
end


