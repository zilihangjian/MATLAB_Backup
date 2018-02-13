function [] = HW02_problem04(L,time)
%function [] = HW02_problem04(L,t)
% Inputs - L for number of iterations and time for the time length that the
% differential equation will be plotted over,
% Output - No output, all cases are defined in the function
% Description: Graphs the differential equation N' = a*N - b*N^2, which is
% used to model a population over time. The first part models the birth
% rate, while the second part models death rate. This function will
% calculate three different plots that differ by the a and b values

clc;
%Part 1: a = 10, b=0,Initial Population = 100 and N' = a*N
deltat = time/L;
N1 = zeros(1,L);
N1(1) = 10;
time = [0:L]*deltat;
a1 = 10;
b1 = 0;
for i=1:L
    N1(i+1) = N1(i) + (deltat.*(a1.*N1(i) - (b1.*(N1(i).^2))));
end
subplot(3,1,1);
plot(time,N1,'b');
xlabel('Time');
ylabel('Population');

%Part 2: a = 10, b=3,Initial Population = 10 and N' = a*N - b*N^2
N2 = zeros(1,L);
N2(1) = 10;
a2 = 10;
b2 = 3;
for i=1:L
    N2(i+1) = N2(i) + (deltat.*(a2.*N2(i) - (b2.*(N2(i).^2))));
end
subplot(3,1,2);
plot(time,N2,'k');
xlabel('Time');
ylabel('Population');

%Part 3: a = 10, b=.01,Initial Population = 1000 and N' = a*N - b*N^2
N3 = zeros(1,L);
N3(1) = 1000;
a3 = 10;
b3 = .3;
for i=1:L
    N3(i+1) = N3(i) + (deltat.*(a3.*N3(i) - (b3.*(N3(i).^2))));
end
subplot(3,1,3);
plot(time,N3,'g');
xlabel('Time');
ylabel('Population');
end