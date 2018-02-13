%Project 3.3
clc; clear;
m = 1500;
k1 = 3250;
k2 = 3500;
k3 = 3000;
A = [(k1+k2)/m, -k2/m; -k2/m, (k2+k3)/m];
[V,D] = eig(A);
fprintf('Modes of Oscillation\n');
disp(V);
disp(D);
