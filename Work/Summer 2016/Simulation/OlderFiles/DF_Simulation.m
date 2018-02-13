function [] = DF_Simulation(dataName, start, duration, testPoint)
%function [] = DF_Simulation(dataName, start, duration, testPoint)
%Function used for testing before development of GUI
%Inputs: dataName, string that corresponds the data accessed by the program
%        start, integer correponding to the starting access point to the
%        data
%        duration, interger corresponding to the ending access point the
%        data
%        testPoint, 1x2 vector correponding to a test transmitter location
%Outputs: No Outputs
%#ok<*NODEF>
rng('shuffle');
%Check Input Parameters
if nargin < 1
    dataName = [];
end

if nargin < 2
    start = [];
end

if nargin < 3
    duration = [];
end

if nargin < 4
    testPoint = [];
end

%Default Values for Parameters
if isempty(dataName)
    error('Missing Data Entry or Data Entry unable to be read ');
end
%Changes location to Data folder to access data and then returns to
%previous location
currentLocation = pwd;
dataLocation = uigetdir();
cd(dataLocation);
clc, load(dataName);
close all;
cd(currentLocation);
% 
% if isempty(start)
%     start = input('Input Initial Data Point: ');
%     while start < 1 && start > dataPoints
%         fprintf('\nData Range: 1 to %d', dataPoints);
%         start = input('\nInput Initial Data Point: ');
%     end
% end
% 
% if isempty(duration)
%     fprintf('\nData Range: 1 to %d', dataPoints);
%     duration = input('\nInput Ending Data Point: ');
%     while duration < start || duration > dataPoints
%         duration = input('\nInput Ending Data Point: ');
%     end
% end
% 
% if isempty(testPoint)
% 
%     fprintf('Input nothing to default to a random Transmitter Location');
%     testPoint = input('\nInput Transmitter Location: ');
%     if isempty(testPoint)
%         default = true;
%         randX = -111.32 + (-111.40 - (-111.32)).*rand(1,1);
%         randY = 33.04 + (33.10 - (33.04)).*rand(1,1);
%         testPoint = [randX randY]; 
%     end
%     
%     while ~(isvector(testPoint)) || length(testPoint) ~= 2 && ~default
%         fprintf('\nTransmitter Location should be vector of size [1,2]');
%         testPoint = input('\nInput Transmitter Location: ');
%     end
% end
clc; 
tic
test3D();
%Minimizes the following vectors and cell arrays to only contain the data
%specified by start and duration

% [azimuth, theta, PlatLon, PlatLat, Type] = ...
%     arrayMinimization(azimuth, theta, PlatLon, PlatLat,Type, start, duration);
% % %Plots the Line of Bearings for the original receiver data using the theta
% %values, then plots the position of the transmitter
% [LOB] = plotLineBearings(PlatLon, PlatLat, theta, transmitterLocation, .05);
% 
% %Determines the theoretical transmitter Location based off the original
% %receiver data using a least squares method
% [relativeLocation1] = LS_2D(PlatLon, PlatLat, theta, transmitterLocation, ...
%     .05);
% 
% %Determines the test theta and azimuth based off the original receiver
% %location and the input transmitter location
% [testTheta, testAzimuth, LOB_length] = determineAngles(PlatLon, PlatLat,...
%     testPoint);
% 
% %Plots the Line of Bearings from the original receiver locations to the
% %input transmitter location
% plotLineBearings(PlatLon, PlatLat, testTheta, testPoint, LOB_length);
% 
% %Determines the theoretical transmitter location based off the original 
% %receiver data and the input transmiter location using a least squares
% %method
% [relativeLocation2] = LS_2D(PlatLon, PlatLat, testTheta, testPoint,...
%     LOB_length ,Type); 
% 
% %Graphically plots and compares the angles for the original and theoretical
% %data
% angleComparison(testTheta, testAzimuth, theta, azimuth);
%  
% MLE(azimuth, PlatLon, PlatLat, 100)
% 
% noisySimulation(PlatLon, PlatLat, testPoint, 1, randomness);
% gaussNewton(PlatLon, PlatLat, [-111, 33], 100, 1e-8,testPoint)
% steepestDescent(PlatLon, PlatLat, [-111,33]);
% noisySimulation(PlatLon, PlatLat, testPoint, 100, 'GN')

PET = toc;%Program Execution Time
disp(PET);
end