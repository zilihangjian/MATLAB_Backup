function [Orbit1 Orbit2 Orbit3] = tel


%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\1293435401A\Documents\MATLAB\tel.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2015/06/25 14:47:27

%% Initialize variables.
filename = 'tel.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
time = dataArray{:, 1};
lat = dataArray{:, 2};
lon = dataArray{:, 3};
height = dataArray{:, 4};

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;





Re = 6371000;
x = Re*tan(lon);
y = Re*tan(lat);
z = height;

% for i=a:1:b  %5555:50:length(x)
%     clf
%     plot3(x(a:i),y(a:i),z(a:i),'LineWidth',2)
%     hold on
%     plot3(x(i),y(i),z(i),'bo')
%     plot3(x(i:b),y(i:b),z(i:b),'r')
%     getframe;
% %     pause(0.05)
% end


x = x - 1.7905e7;
y = y - 4.346e6;
z = z- 514;

a = 15600;
b = 15730;

Orbit1.x = x(a:b);
Orbit1.y = y(a:b);
Orbit1.z = z(a:b);

plot3(x(a:b),y(a:b),z(a:b),'LineWidth',2)
hold on

a = 16100;
b = 16231;

Orbit2.x = x(a:b);
Orbit2.y = y(a:b);
Orbit2.z = z(a:b);

plot3(x(a:b),y(a:b),z(a:b),'LineWidth',2)

a = 17915;
b = 18470;

Orbit3.x = x(a:b);
Orbit3.y = y(a:b);
Orbit3.z = z(a:b);


plot3(x(a:b),y(a:b),z(a:b),'LineWidth',2)


[xx, yy] = meshgrid([-2.5e4 2e4],[-2000 2500]);
zz = zeros(size(xx));
surf(xx,yy,zz,'FaceAlpha',0.15,'FaceColor','y')


