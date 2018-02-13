function [] = test3D()
%function [] = test3D()
%Introductory function for testing the 3D data
currentLocation = pwd;
cd('C:\Users\John\Documents\MATLAB\Direction Finding & Geolocation\Simulation\Data\3D Data');
load('set1data');
cd(currentLocation);

%Variable Declaration
rng('shuffle'); %Shuffles randomness
close all; clc;

%Parameters set based on the given 3D data
randX = -10000 + (1000 - (-10000)).*rand(1,1);
randY = -600 + (600 - (-600)).*rand(1,1);
randZ = 500 + (500 - (700)).*rand(1,1);
randomLocation = [randX, randY, randZ];%Randomly generated transmtter location

%Constants
LOB_error = 3;%Varies by n degrees
simulations = 100;%Currently set to 1 for testing CRLB
estimates = ones(simulations,3); %Holds the transmitter estimates in ]x,y,z] coordinates
azimuthNoise = (LOB_error + (-2*LOB_error.*rand(length(x),simulations)));
elevationNoise = (rand(length(x),simulations));
%Radian Angles

for j = 1: simulations
    azimuthRAD = atan2(randomLocation(1) - x(:), randomLocation(2) - y(:));%azimuth angle
    thetaRAD = (pi/2) - azimuthRAD(:);
    elevationRAD = atan2(randomLocation(3) - z(:), ...
        sqrt( (randomLocation(1) - x(:)).^2 + (randomLocation(2) - y(:)).^2));
    
    %Degree Angles
    azimuthDEG = azimuthRAD(:) .* (180/pi);
    thetaDEG = thetaRAD(:) .* (180/pi);
    elevationDEG = elevationRAD(:) .* (180/pi);
    
    %Line Distances
    distance2D = sqrt((randomLocation(1) - x(:)).^2 + (randomLocation(2) - y(:)).^2);
    distance3D = sqrt((randomLocation(1) - x(:)).^2 +...
        (randomLocation(2) - y(:)).^2 + (randomLocation(3) - z(:)).^2);
    
    %Error Generation
    azimuthNoise = (LOB_error + (-2*LOB_error.*rand(length(x),simulations)));
    elevationNoise = (rand(length(x),simulations));
    
    x2 = x(:) + distance2D(:).*cosd(thetaDEG(:) + azimuthNoise(:,j));
    y2 = y(:) + distance2D(:).*sind(thetaDEG(:) + azimuthNoise(:,j));
    z2 = z(:) + distance2D(:).*tand(elevationDEG(:) + elevationNoise(:,j));
   
    noisyTheta = thetaDEG(:) + azimuthNoise(:,j);
    noisyAzimuth = 90 - noisyTheta(j);
    noisyAzimuthRAD = noisyAzimuth(:) .* (pi/180);
    noisyElevation = elevationDEG(:) + elevationNoise(:,j);
    noisyElevationRAD = noisyElevation .* (pi/180);
    [LS_estimate] = LS_3D(x,y,z,x2,y2,z2);
    estimates(j,1) = LS_estimate(1);
    estimates(j,2) = LS_estimate(2);
    estimates(j,3) = LS_estimate(3);
end



figure(); hold on;

for j = 1: length(estimates)
    plot3([x(j), x2(j)], [y(j), y2(j)],[z(j), z2(j)], 'g');
    plot3(estimates(j,1), estimates(j,2), estimates(j,3), '.b');
end

sigmas = (noisyAzimuthRAD(:) - mean(noisyAzimuthRAD)).^2;
covMatrix = diag(sigmas);

% noisyAzimuthRAD = noisyAzimuthRAD(:) + 2*pi;
% mu = sum(noisyAzimuthRAD) ./ numel(noisyAzimuthRAD);
% sigmas = (noisyAzimuthRAD(:) - mu).^2;
% covMatrix = diag(sigmas);
%
% jacobian = ones(length(x),2);
% syms X Y;
% func = atan2(Y,X);
% gradient_2D = gradient(func);
%
% for i = 1: length(x)
%     gradientNumeric = subs(gradient_2D, {Y,X},{(y2(i) - ...
%         y(i)), (x2(i) - x(i))});
%     jacobian(i,2) = gradientNumeric(1);
%     jacobian(i,1) = gradientNumeric(2);
% end
% FIM = transpose(jacobian) * (covMatrix \ jacobian); %Fisher Information Matrix
% IFIM = inv(FIM);
% sigmaX = IFIM(1,1);
% sigmaY = IFIM(2,2);
% sigmaXY = IFIM(1,2);
% aSquare = (sigmaX + sigmaY)./2 + ...
%     sqrt((((sigmaX - sigmaY).^2)./4) + sigmaXY.^2);
% bSquare = (sigmaX + sigmaY)./2 - ...
%     sqrt((((sigmaX - sigmaY).^2)./4) + sigmaXY.^2);
% tilt = 0.50 * atand(2*sigmaXY/(sigmaX - sigmaY));
% alpha = 2.50;
% a = sqrt(aSquare) * alpha;
% b = sqrt(bSquare) * alpha;
% figure();
% hold on;
% ellipseGeneration(a,b,tilt,0,0);
% centerEstimate = LS_estimate' - randomLocation;
% plot3(centerEstimate(1), centerEstimate(2), centerEstimate(3), 'r.');
% end
end