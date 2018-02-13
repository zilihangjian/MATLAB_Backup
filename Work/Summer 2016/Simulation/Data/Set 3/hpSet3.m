function [] = hpSet3()
close all; clear; clc; load('set3data.mat');
%HP Plot
figure();hold on;title('HP Receiver / Ellipse Data 3');

for i = 1: hpElements
    plot(hpPlatLon(i), hpPlatLat(i), '.g');
    plot(hpSourceLon(i), hpSourceLat(i), '.c');
end
plot(transmitterLocation(1),transmitterLocation(2), '-vb','MarkerSize',10);

plot(transmitterLocation(1),transmitterLocation(2), '-vb','MarkerSize',10);
for i = 1: hpElements
    majorAxis(i) = (semiMajorRadius(i)/93)*.001;%Assume that the major axis is longitude(x axis)
    minorAxis(i) = (semiMinorRadius(i)/110)*.001;
    keyboard
    ellipseGeneration(majorAxis(i),minorAxis(i),ellipseTilt(i), hpSourceLon(i),...
        hpSourceLat(i), 'r');
end
xlabel('Longitude'); ylabel('Latitude');
end

