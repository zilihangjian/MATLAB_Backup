%Problem 2
clear; clc;
P = input('Enter the amount of the loan:');
    while P < 0
        P = input('Enter the amount of the loan:');
    end
I = input('Enter the Interest Rate of the loan between 0 and 1:');
    while I < 0 || I > 1
        I = input('Enter the Interest Rate of the loan between 0 and 1:');
    end
Y = input('Enter the number of years for the loan:');
    while Y < 0
        Y = input('Enter the number of years for the loan:');
    end
N = Y*12;%Number of Months
MI = I/12;%Montly Interest Rate
A = zeros(N);%Matrix representing the set of linear equations
C = zeros(N,1);%Solutions to those equations
for i=1:N
    for j=1: i-1
        A(i,j) = MI;
    end
    C(i) = P*MI;
    A(i,i) = -1;
    A(i,N+1) = 1;
end

for j=1:N
    A(N+1,j) = 1;
end

C(N+1) = P;
x = inv(A)*C;%Principle Payment

fprintf('  Month     MonthlyPayment     PrinciplePayment      Interest Payment\n');
fprintf('--------------------------------------------------------------------\n');
for i =1:N
    Interest(i) = x(N+1) - x(i);
    fprintf('%5i     %10.2f          %10.2f     \t\t%10.2f      \n', ...
        i,x(N+1),x(i),Interest(i));
end