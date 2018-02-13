clc; clear;
clear figure
%Variable Declaration
mu = 4*pi()*10^-7; %Vacuum permeability
I = 8.5; %Current(Amperes)
L = 0.10; %length of wire in meters
y = 0.01; %y distance of point vertically from wire
n = 2000; %number of intervals along the wire - relatively small error if
%l is a factor of n or vice versa
k=1;
xPrime=0;

dl=L/n;
rAmpere=y;
B=zeros(n,1); %preallocate matrix, units are Teslas (SI unit)
% summation
for x=0:dl:L;
    sum=0;
    xPrime=0;
    for i=0:n;
        r = sqrt((x - xPrime)^2 + y^2);
        xPrime=xPrime+dl;
        sum = sum + (dl*y) / (abs(r)^3);
    end
    B(k) = ((mu*I)/(4*pi()))*sum;
    k = k+1;
end
plot(B);
ylim([0,B(n/2)]);
xlim([0,n]);
xlabel('n (multiply by "dl" to yield distance in meters)')
ylabel('Tesla')
title('Plot of Magentic Field vs Distance from Left End of Wire')
% Ampere's Law
BAmpere=(mu*I)/(2*pi()*rAmpere)
B=B(1)