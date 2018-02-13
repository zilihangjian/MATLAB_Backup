clc; close all; clear;
syms t s
X = heaviside(t) - heaviside(t-1);
Y = heaviside(t+1) - heaviside(t);

figure()
ezplot(X,[-1,2]);
figure()
ezplot(Y,[-2,1]);

Xl = 1/s - exp(-s)/s ;
disp(Xl);
Yl = -1/s + exp(s)/s;
disp(Yl);

Zl = Xl*Yl;
disp(Zl);
Z = ilaplace(Zl);
disp(Z);

tc = linspace(-2,2,10000);
Xc = heaviside(tc) - heaviside(tc-1);
Yc = heaviside(tc+1) - heaviside(tc);
tplot = linspace(-2,2,19999);
Zconv = conv(Xc,Yc)./((length(tplot))/4);

figure()
plot(tplot,Zconv)
area = trapz(tplot,Zconv);
disp(area)