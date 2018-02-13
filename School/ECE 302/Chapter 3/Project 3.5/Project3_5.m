%Project 3.5
clc; clear;
n = 100;
Emax = 100;
Emin = -Emax;
A = randi([Emin,Emax],n);
C = randi([Emin,Emax],1,n);

%First Solution
fprintf('Inverse Method\n');
tic;
X1 = inv(A)*transpose(C);
toc;

%Second Solution
fprintf('Gaussian Method\n');
tic;
X2 = A/C;
toc;



