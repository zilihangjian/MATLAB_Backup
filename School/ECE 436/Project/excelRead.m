clc; clear; close all;
format long
currentDirectory = pwd;%Store current directory
[fileName,pathName] = uigetfile();%Prompt file pathname and filename
cd(pathName);%Change to that directory
fileData = importdata(fileName);%Import data using importdata function
cd(currentDirectory)%Change back to current directory

%Parse the Structure
fields = fieldnames(fileData);%Store the field names of the structure variable data
dataField = (fileData.(fields{1}));
textDataField = (fileData.(fields{2}));
numArguments = length(textDataField);

%Process String Data
time = zeros(1,length(dataField));
position = zeros(1,length(dataField));
angle = zeros(1,length(dataField));

for j = 1: length(textDataField)
    tempString = lower(textDataField{j});
    checkTime = strfind(tempString,'time');
    checkPosition = strfind(tempString, 'position');
    checkAngle = strfind(tempString, 'angle');
    if checkTime >= 1 & isequal(time, zeros(1,length(dataField))) %#ok<AND2>
        time = dataField(:,j);
    elseif checkPosition >= 1
        position = dataField(:,j);
    elseif checkAngle >= 1
        angle = dataField(:,j);
    end
end 

figure()
plot(time, position)
title('Cart Position vs. Time')
ylabel('Cart Position (mm)')
xlabel('Time (s)')

figure()
plot(time, angle)
title('Seesaw Angle vs. Time')
ylabel('Seesaw Angle (deg)')
xlabel('Time (s)')


