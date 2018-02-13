%Problem 1
clear; clc;
%Variable Declartions
z = -pi;
step = .1*pi;
%Matrix Declarations
x = zeros(21,1);
ACTUAL_SIN = zeros(21,1);
SERIES_SIN = zeros(21,1);
TERMS = zeros(21,1);

for j=1:21%Generates X Points
    x(j) = z +(j-1)*step;
    ACTUAL_SIN(j,1) = sin(x(j,1));%Creates the Actual sin values
    sum = x(j,1); term = x(j,1);
    
    for k=1:50%Taylor Series Generation
        denominator = 2*k*(2*k+1);
        term = -term*x(j)^2/denominator;
        sum = sum +term;
        difference = abs(sum*1e-6);
        if abs(term) <= difference
            break;
        end
    end
    SERIES_SIN(j) = sum;%Creates the Approximate Sin values
    TERMS(j) = k;
end

figure();
plot(SERIES_SIN, 'g');
xlabel('x');
ylabel('y');
legend('SERIES APPROXIMATION');
grid;
figure();
plot(ACTUAL_SIN, 'r');
xlabel('x');
ylabel('y');
legend('SIN(X)');
grid;
t = table(x, ACTUAL_SIN,SERIES_SIN,TERMS);
disp(t);