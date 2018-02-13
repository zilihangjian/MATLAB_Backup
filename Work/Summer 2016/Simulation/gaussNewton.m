function [GN_estimate, programLength] = gaussNewton(longitude, latitude,...
    initialE, steps, threshold,theta, transmitterLocation)
%function [GN_estimate] = gaussNewton(longitude, latitude, ...
%    initialE, steps, threshold)
tic;
%Variable Declaration
dataPlot = false;
if min(size(longitude)) == 1 && min(size(latitude)) == 1
    distance = sqrt((longitude(:) - transmitterLocation(1)).^2 + ...
        (latitude(:) - transmitterLocation(2)).^2);
    tempLongitude = ones(2,length(longitude));
    tempLatitude = ones(2,length(latitude));
    tempLongitude(1,:) = longitude(1,:);
    tempLongitude(2,:) = longitude(:) + distance(:).*cosd(theta(:));

    tempLatitude(1,:) = latitude(1,:);
    tempLatitude(2,:) = latitude(:) + distance(:).*sind(theta(:));
    longitude = tempLongitude;
    latitude = tempLatitude;
    dataPlot = true;
end
GN_estimate = initialE';% variable holding the position of the estimated transmitter location
locationHistory(1,:) = GN_estimate;
counter = 2;%counter variable
testThreshold = threshold;%comparison variable for the threshold
coordinates = [longitude(1,:);latitude(1,:)]'; %matrix containing x and y coordinates of longitude and latitude
distances = transpose(sqrt((longitude(1,:) - longitude(2,:)).^2 ...
    + (latitude(1,:) - latitude(2,:)).^2));

%Iterations
while (testThreshold >= threshold && counter <= steps)
    %Calculates in a vector the value of all the distances from transmitter
    %guess to the longitude latitude values of the receivers
    r = sqrt((GN_estimate(1) - coordinates(:,1)).^2 + (GN_estimate(2) - coordinates(:,2)).^2);
    
    %Calculates the Jacobian of the data multiplyed by the transpose of the
    %Jacobian of the data
    matr11 = sum((GN_estimate(1) - coordinates(:,1)).^2 ./ r.^2);
    matr12 = sum((GN_estimate(1) - coordinates(:,1)).* (GN_estimate(2) ...
        - coordinates(:,2)) ./ r.^2);
    matr22 = sum((GN_estimate(2) - coordinates(:,2)).^2 ./r.^2);
    matrix1 = [matr11, matr12 ; matr12,matr22];
    
    %Matrix represents the transpose of the Jacobian multiplyed by the
    %function f, where f = r - transmitterEstimate
    matrA1 = sum((r-distances).*(GN_estimate(1) - coordinates(:,1)) ./r);
    matrB1 =  sum((r-distances).*(GN_estimate(2) - coordinates(:,2)) ./r);
    matrix2 = [matrA1; matrB1];
    
    %New Estimate of transmitter location
    posNext = GN_estimate - (matrix1\matrix2);
    
    testThreshold = sqrt(sum((GN_estimate-posNext).^2));
    locationHistory(counter,:) = posNext; 
    GN_estimate = posNext;
    counter = counter + 1;
end

if dataPlot
    %Graphics
    hold on; axis tight;
    title('Gauss Newton Iterations'); xlabel('Longitude'); ylabel('Latitude');
    
    %RePlot
    for j = 1:length(longitude)
        p1 = plot([longitude(1,j), longitude(2,j)], [latitude(1,j), latitude(2,j)],'g');
        pause(.05);
        drawnow;
    end
    
    for i = 1: length(locationHistory)
        p2 = plot(locationHistory(i,1), locationHistory(i,2), 'ro');
        pause(.05);
        drawnow;
    end
    
    for i = 1: length(locationHistory) - 1
        plot([locationHistory(i+1,1), locationHistory(i,1)], ...
            [locationHistory(i+1,2), locationHistory(i,2)], 'r');
        pause(.001);
        drawnow;
    end
    p3 = plot(posNext(1), posNext(2), 'go');
    p4 = plot(transmitterLocation(1), transmitterLocation(2), 'bv',...
        'MarkerSize', 12);
end
legend([p1, p2, p3, p4], 'LOB', 'GN Estimates', 'GN Final Estimate',...
    'Transmitter Location','Location', 'northoutside','Orientation', 'horizontal');
programLength = toc;
end