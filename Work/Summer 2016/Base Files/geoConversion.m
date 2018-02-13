function [dx, dy] = geoConversion(lat1, lon1, lat2, lon2)
    %Constant Variables
    r =  6378.137; % Radius of earth in KM
    
    %Determine x Position
    tempLat2 = 0;
    dLat = (tempLat2 - lat1) .* (pi/180);
    dLon = (lon2 - lon1) .* (pi/180);
    a = (sin(dLat/2)).^2 + cos(lat1 .* (pi/180)) .* cos(tempLat2 .* (pi/180))...
        .* (sin(dLon/2)).^2;
    c = 2 .* atan2(sqrt(a), sqrt(1-a));
    dx = r .* c;
    dx = dx .* 1000;
    
    %Determine y Position
    tempLon2 = 0;
    dLat = (lat2 - lat1) .* (pi/180);
    dLon = (tempLon2 - lon1) .* (pi/180);
    a = (sin(dLat/2)).^2 + cos(lat1 .* (pi/180)) .* cos(lat2 .* (pi/180))...
        .* (sin(dLon/2)).^2;
    c = 2 .* atan2(sqrt(a), sqrt(1-a));
    dy = r .* c;
    dy = dy .* 1000;
end