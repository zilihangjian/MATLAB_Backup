function [] = negjx(x)
%-j values
euler = cos(x) - (i*sin(x));
v = x*(-i);
difference = 1;
approx = 1;%series approximation for exp(jx)
part = 1;%individual parts of the series
%Approximation for exp(jx)
for n=1:100
    part = v^n/factorial(n);
    approx = approx + part;
    difference = abs(exp(i*x) - approx);
    if(difference < .000001)
        break;
    end
end
real = exp(-i*x); 
fprintf('Approximation for exp(-i*x) where x = %.1f\n', x);
fprintf('Approximation = ');
disp(approx);
fprintf('\nReal Value = ');
disp(real);
fprintf('Eulers Method = ', euler);
disp(euler);