% Parts a,c,e involve evaluating the integrals given with the Matlab quad
% function

%a 
clc; clear;
func_a = @(x) ((5*(exp(3*x))+(2*exp(-3*x))).^-1);
A = 0;
B = 3;
C = quad(func_a, A,B);
fprintf('Integration of function (a) over [%.1f to %.1f]', A,B);
fprintf('\nAnswer = %f\n', C);

%c
func_c = @(x) (sinh(x) - cos(x));
D = 0;
E = pi;
F = quad(func_c, D, E);
fprintf('Integration of function (c) over [%.f to pi]',D);
fprintf('\nAnswer = %2.4f\n',F);

%e
%func_e = @(x) (log(x)/.(1-x));
G = 0;
H = 1;
I = quad(inline('log10(x)./(1-x)'),G,H);
fprintf('Integration of function (e) over [%.1f to %.1f]', G,H);
fprintf('\nAnswer = %f\n', I);