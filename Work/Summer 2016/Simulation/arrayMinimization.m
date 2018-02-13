function [newAzimuth, newTheta, longitude, latitude, Type] = ...
    arrayMinimization(azimuth, theta, PlatLon, PlatLat, Type, start,duration)
% function [newAzimuth, newTheta, longitude, latitude, Type] = ...
%     arrayMinimization(azimuth, theta, PlatLon, PlatLat, Type, start,duration)
%Function used for parsing the data provided in the GUI so that the arrays
%are properly sized. Assumes that the input azimuth and theta vector are in
%degrees
               
try
    if start == 1
        newType = cell(1, duration);
        newAzimuth = ones(1, duration);
        newTheta = ones(1, duration);
        longitude = ones(1, duration);
        latitude = ones(1, duration);
    else
        newType = cell(1, duration - start);
        newAzimuth = ones(1, duration - start);
        newTheta = ones(1, duration - start);
        longitude = ones(1, duration - start);
        latitude = ones(1, duration - start);
    end
    
catch ME
    handles = guidata(gcbo);
    info = handles.textInformation;
    info.String = strvcat(info.String,'Unverified Data Set String');
    guidata(gcbo, handles);%update the figure handles
    newAzimuth = [];
    newTheta = [];
    longitude = [];
    latitude = [];
    Type = [];
    return
end
arrayCount = 1;
for j = start: duration
    newType{arrayCount} = Type{j};
    newAzimuth(arrayCount) = azimuth(j);
    newTheta(arrayCount) = theta(j);
    longitude(arrayCount) = PlatLon(j);
    latitude(arrayCount) = PlatLat(j);
    arrayCount = arrayCount + 1;
end

%Azimuth Phasing
%Keeps all of the values of the azimuth between 0 and 360 for comparison
%purposes with different algorithms
if min(newAzimuth) < 0%Tests for below 0
    while (min(newAzimuth) < 0)
        [~,minIndex] = min(newAzimuth);
        newAzimuth(minIndex) = newAzimuth(minIndex) + 360;
    end
elseif max(newAzimuth) > 360%Tests for above 360 
    while (min(newAzimuth) > 360)
        [~,minIndex] = min(newAzimuth);
        newAzimuth(minIndex) = newAzimuth(minIndex) - 360;
    end
end
end