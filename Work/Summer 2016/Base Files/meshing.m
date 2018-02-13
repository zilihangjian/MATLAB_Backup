function [] = meshing(dataName)
%Generate Grid
if nargin < 1
    dataName = [];
end

if isempty(dataName)
    error('Missing Data Entry');
end
load(dataName);
z = 0;
[X, Y] = meshgrid(-111.385:0.015:-111.355, 33.065:1.5419e-04:33.1);
p = cell(1, length(PlatLat));

for j=1: length(PlatLat)
    p{j} = [PlatLon(j) PlatLat(j) z];
end

angleCount = 1;
for i=1: max(size(X))
    for j=1: min(size(X))
        phi(angleCount) = atan2((X(i) - p{angleCount}(1)), (Y(j) - p{angleCount}(2)));
%         elevationTheta(angleCount) = atan2(0, sqrt((X(i) - p{j}(1)).^2 ...
%             + (Y(j) - p{j}(2)).^2));
        angleCount = angleCount + 1;
    end
end
figure(); hold on;
for j = 1: length(phi)
    phi(j) = phi(j) * (180/pi);
%     while phi(j) < 0
%         phi(j) = phi(j) + 360;
%     end
    plot([j+5 j+5], [0 phi(j)], 'k');
end

%Minimization for 2D azimuth only non-weighted(z=0)
[minimum, min_index] = min(phi);

end