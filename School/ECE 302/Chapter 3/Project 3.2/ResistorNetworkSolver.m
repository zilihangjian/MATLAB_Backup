function [ V ] = ResistorNetworkSolver( n, R0, Vref)
%RESISTORNETWORKSOLVER Summary of this function goes here
%   Detailed explanation goes here
solution = zeros(n,1);
solution(1,1) = (-Vref/R0); 
A = (-1/(4*R0));
B = (1/R0);
C = (-1/(3*R0));

V1 = ones(1,n);%Main Diagonal for Matrix
V2 = ones(1,(n-1));%Upper and lower diagonol for Matrix

V1 = V1*A;
V1(1,n) = C;

V2 = V2*B;

R1 = diag(V1);
R2 = diag(V2,1);
R3 = diag(V2,-1);
R = R1+R2+R3;  

V = inv(R)*solution;

end