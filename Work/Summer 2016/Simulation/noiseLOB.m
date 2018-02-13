function [estimates, noisyAzimuth] = noiseLOB(longitude, latitude, testPoint,...
    randomNoise, currentIteration, estimates, estimator, gridSize,...
    xMin, xMax, yMin, yMax)
%function [estimates, noisyAzimuth] = noiseLOB(longitude, latitude, testPoint,...
%     randomNoise, currentIteration, estimates, estimator)
%Inputs:  longitude, vector containing the longitude values
%         latitude, vector containing the latitude values
%         testPoint, theoretical transmitter location generated randomly
%         randomNoise, noise matrix containing
%         currentIteration,
%Outputs: No Outputs

%Variable Declaration
%Contains the data point for plotting, noisy(1,:) contains the original
%data, noisy(2,:) contains the error transmitter location
% noisyLong = ones(2,dataPoints);
% noisyLat = ones(2,dataPoints);

%distance between estimated value and the actual transmitter location
distances = sqrt((longitude(:) - testPoint(1)).^2 ...
    + (latitude(:) - testPoint(2)).^2);
noisyLong(1,:) = longitude(:);
noisyLat(1,:) = latitude(:);
noisyAzimuth = randomNoise(:,currentIteration)'...
    + atan2(testPoint(1) - noisyLong(1,:), testPoint(2) - noisyLat(1,:));

%Generates ending x coordinate of line
noisyLong(2,:) = noisyLong(1,:) + ...
    transpose((distances(:).*cos(((pi/2) - noisyAzimuth(:)))));

%Generates ending y coordinate of line
noisyLat(2,:) = noisyLat(1,:) + ...
    transpose((distances(:).*sin(((pi/2) - noisyAzimuth(:)))));

%Least Squares Estimator
if strcmp(estimator, 'LS')
    [LS_estimate] = simLS_2D(noisyLong, noisyLat);
    estimates(currentIteration,1) = LS_estimate(1);
    estimates(currentIteration,2) = LS_estimate(2);

%Maximum Likelihood Estimator
elseif strcmp(estimator, 'MLE')
    [MLE_estimate] = simMLE(noisyAzimuth, noisyLong, noisyLat, gridSize,...
         xMin, xMax, yMin, yMax);
    estimates(currentIteration,1) = MLE_estimate(1);
    estimates(currentIteration,2) = MLE_estimate(2); 
end

end