clear; clc; load('set4data.mat');
dataPoints = length(PlatLat);
i = 1;
for j=1: dataPoints
    if strcmp(Type{j},'HP')
        hpSourceLat(i) = SourceLat(j)';
        hpSourceLon(i) = SourceLon(j)';
        hpPlatLat(i) = PlatLat(j)';
        hpPlatLon(i) = PlatLon(j)';
        semiMajorRadius(i) = CellipMajm(j)';
        semiMinorRadius(i) = CellipMinm(j)';
        ellipseTilt(i) = CellipTiltdeg(j)';
        hpAzimuth(i) = AZdeg(j)';
        hpTheta(i) = theta(j)';
        i = i + 1;
    end
end

k = 1;
for j=1: dataPoints
    if strcmp(Type{j}, 'LP')
        lpPlatLat(k) = PlatLat(j)';
        lpPlatLon(k) = PlatLon(j)';
        lpAzimuth(k) = AZdeg(j)';
        lpTheta(k) = theta(j)';
        k = k + 1;
    end
end