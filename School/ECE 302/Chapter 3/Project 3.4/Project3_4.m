clc; clear;
P = input('Enter an amount for the loan: ');
while P < 0
   P = input('Enter an amount for the loan: ');
end

I = input('Enter an amount between 0 and 1 for the interest rate:');
while I < 0 || I > 1
   I = input('Enter an amount for the loan: ');
end

Y = input('Enter a number in years to pay the loan: ');
while Y < 0
    Y = input('Enter a number in years to pay the loan: '); 
end

N = Y*12;%Number of Months
i = (I/12);%Monthly interest rate
M = ((P*i)*((1+i)^N))/((-1+((1+i)^N)));%Monthly payment formula

%Matrix Declarations
MonthlyPayment = M*ones(N+1,1);
Month = zeros(N+1,1);
for k=1:length(Month)
    Month(k,1) = k;
end
Balance = zeros(N+1,1);
PrinciplePayment = zeros(N+1,1);
InterestPayment = zeros(N+1,1);

%Instantiation
Balance(1,1)=P;%Balance over the time period
InterestPayment(1,1)=0;%Interest Payment 
PrinciplePayment(1,1)=0;%Monthly Principle Payment

for k=2:N+1;
    InterestPayment(k,1)=Balance(k-1,1)*i;%Previous balance - monthlyrate
    PrinciplePayment(k,1)=M-InterestPayment(k,1);%MonthlyPayment - InterestPayment
    Balance(k,1)=Balance(k-1,1)-PrinciplePayment(k,1);%Previous Balance - PrinciplePayment
end

t = table(Month,Balance,PrinciplePayment,InterestPayment,MonthlyPayment);
disp(t);