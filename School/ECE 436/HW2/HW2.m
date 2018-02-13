clc; clear; close all;

fprintf('HW2 17a\n')
syms s1;
syms V1;
matA1 = [s1+1, -s1; -s1, s1+2];
disp(matA1);
matB1 = [V1;0];
disp(matB1);
currents1 = matA1\matB1;
disp(currents1);
I2_1 = currents1(2);
disp(I2_1);
fprintf('------------------------------------------------------------------\n');
fprintf('HW2 17b\n')
syms s2;
syms V2;
matA2 = [2, -1; -1,(s2+1+(1/(2*s2)))];
disp(matA2);
matB2 = [V2;0];
disp(matB2);
currents2 = matA2\matB2;
disp(currents2);
I2_2 = currents2(2);
disp(I2_2);
fprintf('------------------------------------------------------------------\n');
fprintf('HW2 19a\n')
syms s3;
syms V3;
matA3 = [2*s3+1, -1; -1,(3*s3+1+(2/s3))];
disp(matA3);
matB3 = [V3;0];
disp(matB3);
currents3 = matA3\matB3;
disp(currents3);
I2_3 = currents3(2);
disp(I2_3);
fprintf('------------------------------------------------------------------\n');
fprintf('HW2 19b\n')
syms s4;
syms V4;
matA4 = [2*s4, -s4, -s4, 0;...
    -s4, (2*s4+1), 0, -1;...
    -s4, 0, (s4 + 1/s4), -1/s4;...
    0, -1, -1/s4, (2/s4 + 1)];
disp(matA4);
matB4 = [V4;0;0;0];
disp(matB4);
currents4 = matA4\matB4;
disp(currents4)
I3_4 = currents4(3);
disp(I3_4)
fprintf('------------------------------------------------------------------\n');
