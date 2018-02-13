clear; clc; close all;
syms x
carrSig = cos((2*pi*1000)*x);
messSig = cos((2*pi*10e3)*x);
tay1 = taylor(exp(carrSig + messSig));
disp(tay1)