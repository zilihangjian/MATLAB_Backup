function [C,p] = Gaussian_2D(sigmas, rho)
%function [C,p] = Gaussian_2D(sigmas, rho)
% [C,p] = Gaussian_2D(sigmas, rho);
% Inputs: sigmas, 1x2 row vector of the variances of X and Y
%         rho = correlation coefficient between -1 and 1 of X and Y  
% Outputs: C = Covariance Matrix, p = 2-D pdf, plots Surface Plot of pdf


if abs(rho) > 1
    error('rho must be between -1 and 1');
end

maximum = max(sigmas); 
x = 3*maximum*(-100: 100)/100;
y = x;

cov_xy = rho*sqrt(sigmas(1)*sigmas(2));
C = [sigmas(1) cov_xy; cov_xy sigmas(2)];
Const = 1/(2*pi*sqrt(det(C)));

[X,Y] = meshgrid(x,y);

C_inv = inv(C);
quad_form = C_inv(1,1)*(X.^2) + C_inv(2,2)*(Y.^2) + 2*C_inv(1,2)*(X.*Y);

p = Const*exp(-0.5*quad_form);

subplot(2,1,1);
surf(x,y,p);
subplot(2,1,2); 
contour(x,y,p);
axis tight;
end