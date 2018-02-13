%CRLB TEST
close all
currentLocation = uigetdir();
cd('C:\Users\John\Documents\MATLAB\Direction Finding & Geolocation\Simulation\Data\2D Data')
load('set1data');
cd(currentLocation);
[estimate,time] = LS_2D(PlatLon,PlatLat,theta,transmitterLocation,.05);
newCRLB(estimate, xPosition, yPosition, transmitterLocation);