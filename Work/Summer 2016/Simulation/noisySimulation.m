function [simulationLength] = noisySimulation(longitude,...
    latitude, testPoint, simulations, azimuth,...
    estimator, LOB_error, gridSize, xMin, xMax, yMin, yMax)
% function [] = noisySimulation(longitude, latitude,testPoint, simulations)
%Inputs:  longitude, vector containing the values for the longitude
%         positions
%         latitude, vector containing the values for the latitude positions
%         testPoint, randomly generated 1x2 vector for transmitter location
%         simulations, number of iterations for the simulation to run
%Outputs: No Outputs
tic;
%Variable Declaration
%The noise matrix generates the error associated with each angle for the
%simulation. If the error is 10% or 0.10, then the angles can vary in
%error from -10% to + 10% error. The matrix will need to be able to hold
%NxN number of receiver data points error values

randomNoise = (LOB_error + (-2*LOB_error.*rand(length(longitude),simulations)));
estimates = ones(simulations,2);%Stores the values of the determined
%transmitter location either through the MLE or LS

%Simulation for however many simulations are specified
for iteration = 1: simulations
    
    [estimates, noisyAzimuth] = noiseLOB(longitude, latitude, testPoint,...
    randomNoise, iteration, estimates, estimator, gridSize,...
    xMin, xMax, yMin, yMax);
end
keyboard


%Graphics
% figure(); set(gcf, 'Position',get(0,'Screensize'));

%Statistical Generation of Confidence Ellipses based off the data
% estimateCenter = [estimates(:,1) - testPoint(1), estimates(:,2) - testPoint(2)];
% [distanceX, distanceY] = geoConversion(0,0, estimateCenter(:,1),...
%     estimateCenter(:,2));
% plot(distanceX(:), distanceY(:), '.b');
% plot(0, 0,'vk', 'MarkerSize', 10); 

% for j = 1: length(longitude)
%     [x1, y1] = geoConversion2(longitude(j), latitude(j));
%     x(j) = x1;
%     y(j) = y1;
% end

% [xTL, yTL] = geoConversion2(testPoint(1), testPoint(2));
% xCenter = x(:) - xTL;
% yCenter = y(:) - yTL;
% title('CRLB');
% axis tight; hold on;
% xlabel('Longitude'); ylabel('Latitude');
CRLB(testPoint, azimuth, noisyAzimuth, estimates);

% for j = 1: length(estimates)
%     [estimateX, estimateY] = geoConversion2(estimates(j,1), estimates(j,2));
%     estimateX = estimateX - xTL;
%     estimateY = estimateY - yTL;
%     plot(estimateX, estimateY,'.b');
% end

% STD_Ellipse(estimates, testPoint);

simulationLength = toc;
end