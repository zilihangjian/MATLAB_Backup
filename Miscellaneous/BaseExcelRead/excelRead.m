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
T = table(dataField(:,1), dataField(:,2),...
      dataField(:,3), dataField(:,4), 'VariableNames',...
      {textDataField{1}, textDataField{2},...
      textDataField{3}, textDataField{4}});
disp(T)


