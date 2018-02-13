%{
Program to compute FS of periodic signal x(t)=2 for 0<t<3, and x(t)=0
for 3<t<6, with period T=6.  The FS coefficients are: a0=1; ak=0 for
k even and nonzero; ak=2/(j*pi*k) for k odd. The FS is truncated to the
first N harmonics (-N to N).  N must be a postive integer.
%}
N=21;
t=linspace(0,10,1000*ceil(N/100));

y=1; %The 0th harmonic term (k=0)
for k=-N:N
    if mod(k,2)==1
        ak = 2/(j*pi*k);
        y = y + ak*exp(j*k*(pi/3)*t);
    end
end
%The loop is computationally inefficient but simple.

plot(t,real(y),'LineWidth',1.5)  %See note below
grid

%{
Note: In theory, taking the real part of y should not be necessary
in the plot command.  However, due to computational inaccuracies,
it is possible for y to have very a small but nonzero imaginary part,
which would give error or warning messages.
%}