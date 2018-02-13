function [x,t] = Class_Euler_Decay(A,deltat,N,tau)
%CLASS_EULER_DECAY Summary of this function goes here
%   Detailed explanation goes here
x = zeros(N,1);
t = [0:N-1].*deltat;
x(1) = A;

for n=2:N
    x(n) = x(n-1) - (deltat).*x(n-1)./tau;    
end

x = transpose(x);

%Actual Values
Nt = A*exp(-t/tau);
Error = zeros(1,length(x));
for j=1:100
    Error(1,j) = abs((x(1,j)-Nt(1,j))/Nt(1,j))*100;
end
subplot(2,1,1);
plot(t,x,'r',t,Nt,'b');
axis([0 2 0 100]);
subplot(2,1,2);
plot(t,Error,'g');
axis([0 .5 0 .5]);















end
