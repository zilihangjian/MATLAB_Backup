clear; clc; load('set1data.mat');
dataPoints = length(PlatLat);
i = 1;
for j=1: dataPoints
    if strcmp(Type{j},'HP')
        hpSourceLat(i) = str2double(SourceLat1{j});
        hpSourceLon(i) = str2double(SourceLon1{j});
        hpPlatLat(i) = PlatLat(j);
        hpPlatLon(i) = PlatLon(j);
        semiMajorRadius(i) = str2double(CellipMajm1{j});
        semiMinorRadius(i) = str2double(CellipMinm1{j});
        ellipseTilt(i) = str2double(CellipTiltdeg1{j});
        hpAzimuth(i) = AZ(j);
        hpTheta(i) = theta(j);
        i = i + 1;
    end
end

k = 1;
for j=1: dataPoints
    if strcmp(Type{j}, 'LP')
        lpPlatLat(k) = PlatLat(j);
        lpPlatLon(k) = PlatLon(j);
        lpAzimuth(k) = AZ(j);
        lpTheta(k) = theta(j);
        k = k + 1;
    end
end