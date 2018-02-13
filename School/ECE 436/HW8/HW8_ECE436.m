%Problem 19
clc; close all; clear;
h = tf([1 -3 2],[1 3 2 0]);
figure()
rlocus(h)