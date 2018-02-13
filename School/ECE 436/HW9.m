%Chapter 8 Problem 21
clc; close all; clear
sys = zpk([1 2],[0 -1 -2],1);
figure()
rlocus(sys);