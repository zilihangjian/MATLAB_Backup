function [MLE_estimate, programLength] = MLE_2D(trueAzimuth,...
    longitude, latitude, gridSize,yMin, yMax, xMin, xMax)
% function [MLE_estimate] = MLE(trueAzimuth, latitude, longitude)
% Inputs:  trueAzimuth, vector containing the values for the receiver data
%          azimuth values
%          latitude, vector with the receiever latitude values
%          longitude, vector with the receiver longitude values
% Outputs: positionGrid, an NxN matrix containing the intensity values
%          associated with each point on the grid
%          MLE_estimate, the theoretical transmitter location
%          determined through the Maximum Likelihood Estimation

%Grid Setup / Variable Declaration
%Grid will be gridSize x gridSize matrix
tic;
positionGrid = ones(gridSize, gridSize);
[X,Y] = meshgrid(linspace(xMin, xMax,gridSize), linspace(yMin,yMax,gridSize));

for j = 1: gridSize
    for k = 1: gridSize
        gridPoint = [X(j,k), Y(j,k)];%Considered the location of the test transmitter to compare angles with the original receiver data
        [~, testAzimuth,~] = determineAngles(longitude, latitude, gridPoint);
        azimuthDifference = (testAzimuth(:) - trueAzimuth(:)).^2;
        positionGrid(j,k) = 1/sum(azimuthDifference);
    end
end

[~, maxIndex] = max(positionGrid(:));%Determines the location in the matrix of the minimum value
[xP, yP] = ind2sub(size(positionGrid), maxIndex);
MLE_estimate = [X(xP,yP) Y(xP,yP)];%The MLE determined transmitter location

%Graphics
hold on; title('Maximum Likelihood Grid Search Surface Plot');
xlabel('Longitude'); ylabel('Latitude'); axis tight;
surf(X,Y,10*log10(positionGrid),'LineStyle','None');
programLength = toc;
end