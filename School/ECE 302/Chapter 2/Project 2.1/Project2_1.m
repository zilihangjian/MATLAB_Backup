%Project 2.1
%
clc; clear;
x = transpose(zeros(1,20));
x(1,1) = -pi;
z = -1;
COS = transpose(zeros(1,20));
COS_SERIES = transpose(zeros(1,20));
terms = transpose(zeros(1,20)); 
for n=2:21
    z = z + .1;
    x(n,1) = z*pi;
    if abs(z*pi) < 1e-7
        x(n,1) = 0;
    end
end
COS = cos(x);
for n = 1:21
    if abs(COS(n,1)) < 1e-7
        COS(n,1) = 0;
    end
end

for n = 1:21
    temp = cos_approx(x(n,1));
    COS_SERIES(n,1) = temp(1,1);
    Terms(n,1) = temp(1,2); 
end
%Plot and Table
T = table(x, COS, COS_SERIES, Terms);
disp(T);

figure();
plot(x,COS_SERIES, 'r');
title('Approximation');