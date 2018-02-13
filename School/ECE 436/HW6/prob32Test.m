%Part b
clc; close all; clear;
OS_B = 3/11;
Tp_B = 1;
zetab = (-log(OS_B) / sqrt((pi^2) + log(OS_B)^2));
wnB = (pi/(Tp_B*sqrt(1-zetab^2)));
fprintf('Zeta | %g\n', zetab);
fprintf('Omega | %g\n', wnB);