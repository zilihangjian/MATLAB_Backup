%ECE 436 Transfer Function SISOTOOL Script

clc; clear; close all;
%Original Transfer Functions
GXV = tf([0.4489, 0, -3.181],[0.3555, 1.273, -1.202, -9.023, -54.13]);
GTX = tf([0.09375, 0, -7.357],[0.4188, 0, -2.968]);
GTV = tf([0.1005, 0, -7.885],[0.3555, 1.264, -1.892, -9.023, -54.13]);

%Cx = 57.812(s+6.4)
Cx = tf([57.812, 369.9968],[1]);%First Transfer Coefficients
Gsub = feedback(GXV,Cx);
GSTX = Gsub*GTX;

%Ct = 157.5(s+2.385)
Ct = tf([157.5, 375.6375],[1]);

