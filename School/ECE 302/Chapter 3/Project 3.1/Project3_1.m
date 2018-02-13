%Project 3.1 
%Solves a circuit with a 5x5 matrix based off the unknown current values 
%Displays the current values

clc;
clear;
R1 = 2200;
R2 = 100000;
R3 = 6900;
R4 = 9100;
R5 = 3300;
V1 = 12;
V2 = 3.3;
I1 = .002;
A = [1 1 1 0 0; 0 -1 0 1 0; 0 0 1 1 -1; R1 -R2 0 -R4 -R5; 0 R2 R3 R4 0];
C = [0; -I1; 0; (V1-V2); 0];
X = A \ C;
%Display the Results
fprintf('V1= %9.1f V \nV2= %9.1f V \nI1= %9.1f A\n', V1,V2,I1);
fprintf('R1= %9.1f R \nR2= %9.1f R \nR3= %9.1f R\n', R1,R2,R3);
fprintf('R4= %9.1f R\nR5= %9.1f R\n', R4,R5);
fprintf('\n');
fprintf(' Current #     A (Amps)\n');
fprintf(' ______________________\n');
for n = 1: length(C)
    fprintf(' %f     %1.5f\n', n, X(n));
end
