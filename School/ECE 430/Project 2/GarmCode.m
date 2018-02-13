%Garmatyuk Code
clc; clear; close all;
L = 1000;
W = 1000;
xt = 500;
yt = 500;
xt2 = 501;
yt2 = 500;
t1 = (2*sqrt(xt^2 + yt^2)) / 3e8;
t2 = (2*sqrt(xt2^2 + yt2^2)) / 3e8;
del_t = abs(t2-t1);
tmax = (2*sqrt(L^2 + W^2))/3e8;
tline = 0:del_t:tmax;
NT = length(tline);
xk = 353;
tk = (2*sqrt((xt - xk)^2 + yt2^2)) / 3e8;
error = abs(tline - tk);
xindx = find(error == min(error));%Same as min(error)
txsig = randn(1,16);
plot(txsig);
rxk = [zeros(1,xindx-1), txsig, zeros(1,NT-xindx-15)];
figure()
plot(tline,rxk);
rxcompressed = xcorr(txsig, rxk);
figure()
plot(rxcompressed);

mf_rxk = abs(xcorr(rxk,txsig));
mf_rxk_plot=mf_rxk(NT:2*NT-1);
figure;
plot(tline, mf_rxk_plot);
grid;
keyboard