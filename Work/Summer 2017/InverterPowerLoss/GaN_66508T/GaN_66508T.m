%GaN GS66508T
%Load Data
clc; close all; clear;
load('IDS_VGS.mat')

%IGBT Curve Fitting
[VGS1,IDS1] = parseData(IDS_VGS_TJ125);
[VGS2,IDS2] = parseData(IDS_VGS_TJ25);
transC125 = fit(VGS1, IDS1,'poly1');
transC25 = fit(VGS2, IDS2,'poly1');
coeff125 = coeffvalues(transC125);
coeff25 = coeffvalues(transC25);