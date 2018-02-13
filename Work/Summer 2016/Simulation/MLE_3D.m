function [MLE_estimate, programLength] = MLE_3D(trueAzimuth,...
    trueElevation, x, y, z, gridSize, yMin, yMax, xMin, xMax, zMin, zMax)
% function [MLE_estimate] = MLE(trueAzimuth, latitude, longitude)
% Inputs:  trueAzimuth, vector containing the values for the receiver data
%          azimuth values
%          latitude, vector with the receiever latitude values
%          longitude, vector with the receiver longitude values
% Outputs: positionGrid, an NxN matrix containing the intensity values
%          associated with each point on the grid
%          MLE_estimate, the theoretical transmitter location
%          determined through the Maximum Likelihood Estimation
%Not Currently Working


%Grid Setup / Variable Declaration
%Grid will be gridSize x gridSize matrix
tic;
positionGrid = ones(gridSize, gridSize, gridSize);
[X,Y,Z] = meshgrid(linspace(xMin, xMax,gridSize), linspace(yMin,yMax,gridSize),...
    linspace(zMin, zMax, gridSize));
for i = 1: gridSize
    for j = 1: gridSize
        for k = 1: gridSize
            gridPoint = [X(i,j,k), Y(i,j,k), Z(i,j,k)];%Considered the location of the test transmitter to compare angles with the original receiver data
            testAzimuth = atan2(gridPoint(1) - x(:), gridPoint(2) - y(:));
            testElevation = atan2(gridPoint(3) - z(:), ...
            sqrt((gridPoint(1) - x(:)).^2 + (gridPoint(2) - y(:)).^2));
            azimuthDifference = (testAzimuth(:) - trueAzimuth(:)).^2;
            elevationDifference = (testElevation(:) - trueElevation(:)).^2;
            positionGrid(i,j,k) = 1/(sum(azimuthDifference) ...
                 + 1/sum(elevationDifference));
        end
    end
end
keyboard
[~, maxIndex] = max(positionGrid(:));%Determines the location in the matrix of the minimum value
[xP, yP] = ind2sub(size(positionGrid), maxIndex);
MLE_estimate = [X(xP,yP) Y(xP,yP)];%The MLE determined transmitter location

%Graphics
hold on; title('Maximum Likelihood Grid Search Surface Plot');
xlabel('Longitude'); ylabel('Latitude'); axis tight; rotate3d on
surf(X,Y,10*log10(positionGrid),'LineStyle','None');
programLength = toc;
end