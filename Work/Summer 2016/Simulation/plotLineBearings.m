function [] = plotLineBearings(PlatLon, PlatLat, theta, ...
    transmitterLocation, distance)
% function [] = plotRelativeBearing(PlatLon, PlatLat, theta,...
%     transmitterLocation)
% Inputs:   PlatLon, the longitude position of the receiver 
%           PlatLat, the latitude position of the receiver
%           duration, integer cutoff point to stop accessing the receiver data
%           transmitterLocation, the location of the transmitter in the form
%           [longitude, latitude]
%           distance, length of the LOB to be plotted graphically 
% Outputs:  No Outputs
% Function used for plotting the data from the receivers assuming that 
% longitude, latitude, and coordinate theta angles are included in the
% data, along with transmitter location coordinates. Assumed that the
% arrayMinimization has been run so that the data has been narrowed to the
% specified range. Also the data is animated to show each line of bearing
% plotted individually.

%Graphics
% set(gcf, 'Position',get(0,'Screensize'));
title('Lines of Bearing');
axis tight; hold on;
xlabel('Longitude'); ylabel('Latitude');

%Variable Declaration
dataPoints = length(PlatLon);

%Generates the ending point for the LOB to be plotted
x2 = PlatLon(:) + distance*cosd(theta(:));
y2 = PlatLat(:) + distance*sind(theta(:));

for j = 1: dataPoints
%   Animation, change the pause value to a value that corresponds to the
%   length of pause time. Higher yields slower plots and vice versa
    pause(.001);
    drawnow;
    p1 = plot([PlatLon(j) x2(j)'],[PlatLat(j) y2(j)'], 'r');  
end

%Plots Transmitter Location
p2 = plot(transmitterLocation(1),transmitterLocation(2), '-vg','MarkerSize',10);
legend([p1, p2], 'LOB', 'Transmitter Location', 'Location', 'northoutside',...
    'Orientation', 'horizontal');
end