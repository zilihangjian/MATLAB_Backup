function [positionX, positionY, positionZ] = geoConversion2(lon, lat)
%function [positionX, positionY, positionZ] = geoConversion2(lon, lat)
%Used for converting the longitude, latitude coordinates to x,y,z
%coordinates centered around (0,0,0). Found on a website that I no longer
%can find the link for. I plan to search for it as it provided source
%information to the code. This link is close but not exact: 
%stackoverflow.com/questions/1185408/converting-from-longitude-latitude-to-cartesian-coordinates
% cosLat = cos(lat .* (pi/180));
% sinLat = sin(lat .* (pi/180));
% cosLon = cos(lon .* (pi/180));
% sinLon = sin(lon .* (pi/180));
% radius = 6378137.0;
% f = 1.0/298.257224;
% C = 1.0/ sqrt(cosLat .* cosLat + (1-f) .* (1-f) .* sinLat .* sinLat);
% S = (1.0 - f) .* (1.0 - f) * C;
% h = 0.0;
% keyboard
% positionX = (radius .* C + h) .* cosLat .* cosLon;
% positionY = (radius .* C + h) .* cosLat .* sinLon;
% positionZ = (radius .* S + h) .* sinLat;

%Rough Translation Assuming the Earth is a Sphere
R = 6371e3;%Radius of earth in kilometers
positionX = R .* cos(lat(:).*(pi/180)) .* cos(lon(:).*(pi/180)); 
positionY = R .* cos(lat(:).*(pi/180)) .* sin(lon(:).*(pi/180));
positionZ = R .* sin(lat(:).*(pi/180));
end

