%References 
% https://www.mathworks.com/help/control/ug/build-app-with-interactive-plot-updates.html?requestedDomain=www.mathworks.com
% https://www.mathworks.com/help/control/ref/updatesystem.html
% http://stackoverflow.com/questions/15975758/matlab-simple-slider-on-a-figure
% uicontrol.Positon ([left bottom width height])
% https://www.mathworks.com/matlabcentral/newsreader/view_thread/323414
% http://stackoverflow.com/questions/21681167/continuously-update-slider-in-matlab
function [] = DCM_CCM_GUI()
% function [] = DCM_CCM_GUI()
close all; clc; 

%Main Figure
DCM_CCM = figure(...
    'Name', 'DCM / CCM Visual Demonstration',....
    'Menubar','none',...
    'Position', [0,0,1080,720],...
    'units', 'normalized',...
    'Resize', 'off');
%UI Panel
graphPanel = uipanel(...
    'Parent', DCM_CCM,...
    'Title', 'Visualization',...
    'FontSize', 12,...
    'Tag', 'graphPanel',...
    'Position',[.010, 0.010, 0.990 ,0.990]);
set(graphPanel, 'units', 'normalized');

%Axes
ax = axes(...
    'Parent',graphPanel,...
    'position',[0.075 0.35  0.60 0.60]);
set(ax, 'units','normalized');

%Axis Labels
title(ax,'Boost Converter Average Inductor Current');
xlabel(ax,'Duty Cycle')
ylabel(ax,'Average Inductor Current');

textInformation = uicontrol(...
    'Parent', DCM_CCM,...
    'Style', 'edit',...
    'String', 'Information Panel',...
    'Units', 'centimeter',...
    'Enable', 'inactive',...
    'BackgroundColor', 'white',...
    'Tag', 'textInformation',...
    'Min', 0,...
    'Max', 5,...
    'HorizontalAlignment','left',...
    'Position', [5.5,1.5, 10,2.50]);
set(textInformation, 'units','normalized');
%Duty Control Slider
duty = 0.50;%Initial Slider Position
dutyControl = uicontrol(...
    'Parent',graphPanel,...
    'Style','slider',...
    'Position',[775,600,275,20],...
    'value',duty, ...
    'Callback', @updatePlot,...
    'Tag', 'dutyControl',...
    'min',0, 'max',1);
set(dutyControl, 'units', 'normalized');
addlistener(dutyControl,'Value','PostSet',@updatePlot);

%Duty Cycle Text
dutyText = uicontrol(...
    'Parent',graphPanel,...
    'Style','text',...
    'FontSize', 12,...
    'Position',[775,625,80,20],...
    'String','Duty Cycle');
set(dutyText, 'units', 'normalized');


%Load Resistance Slider
Rload = 20;%Initial Slider Position
loadControl = uicontrol(...
    'Parent',graphPanel,...
    'Style','slider',...
    'Position',[775,500,275,20],...
    'value',Rload, ...
    'Callback', @updatePlot,...
    'Tag', 'loadControl',...
    'min',0, 'max',50);
set(loadControl, 'units', 'normalized');
addlistener(loadControl,'Value','PostSet',@updatePlot);

%Load Resistance Text
loadText = uicontrol(...
    'Parent',graphPanel,...
    'Style','text',...
    'FontSize', 12,...
    'Position',[775,525,120,25],...
    'String','Resistive Load');
set(loadText, 'units', 'normalized');

%Output Voltage Slider
Vout = 10;%Initial Slider Position
voltageControl = uicontrol(...
    'Parent',graphPanel,...
    'Style','slider',...
    'Position',[775,400,275,20],...
    'value',Vout, ...
    'Callback', @updatePlot,...
    'Tag', 'voltageControl',...
    'min',0, 'max',50);
set(voltageControl, 'units', 'normalized');
addlistener(voltageControl,'Value','PostSet',@updatePlot);

%Output Voltage Text
vText = uicontrol(...
    'Parent',graphPanel,...
    'Style','text',...
    'FontSize', 12,...
    'Position',[775,425,120,25],...
    'String','Output Voltage');
set(vText, 'units', 'normalized');


%Inductor Slider
L = 100e-6;%Initial Slider Position
inductorControl = uicontrol(...
    'Parent',graphPanel,...
    'Style','slider',...
    'Position',[775,300,275,20],...
    'value',L, ...
    'Callback', @updatePlot,...
    'Tag', 'inductorControl',...
    'min',100e-9, 'max',100e-4);
set(inductorControl, 'units', 'normalized');
addlistener(inductorControl,'Value','PostSet',@updatePlot);

%Output Inductor Text
LText = uicontrol(...
    'Parent',graphPanel,...
    'Style','text',...
    'FontSize', 12,...
    'Position',[775,325,120,25],...
    'String','Inductor Value');
set(LText, 'units', 'normalized');


%Frequency Slider
freq = 50e3;%Initial Slider Position
frequencyControl = uicontrol(...
    'Parent',graphPanel,...
    'Style','slider',...
    'Position',[775,200,275,20],...
    'value',freq, ...
    'Callback', @updatePlot,...
    'Tag', 'frequencyControl',...
    'min',20e3, 'max',100e3);
set(frequencyControl, 'units', 'normalized');
addlistener(frequencyControl,'Value','PostSet',@updatePlot);

%Frequency Text
fText = uicontrol(...
    'Parent',graphPanel,...
    'Style','text',...
    'FontSize', 12,...
    'Position',[775,225,120,25],...
    'String','Frequency Value');
set(fText, 'units', 'normalized');

%Default Layout
dutyVector = linspace(0,1,1000);
hold on;
plot(dutyVector, ((Vout.*(1-dutyVector).*dutyVector)./(L*freq)), 'b');%ILB
plot(dutyVector, (((Vout.*((1-dutyVector).^2).*dutyVector)./(2*L*freq))),'r');%IOB
hold off;
end

function [] = updatePlot(~,~)
dutyCycle = findobj('Tag', 'dutyControl'); 
Rload = findobj('Tag', 'loadControl');
L = findobj('Tag', 'inductorControl');
Vout = findobj('Tag', 'voltageControl');
freq = findobj('Tag', 'frequencyControl');
Iout = Vout.Value / Rload.Value;
Vin = Vout.Value*(1-dutyCycle.Value);
Iin = (Vout.Value*Iout)./Vin;
dutyVector = linspace(0,1,1000);

cla
hold on;
plot(dutyVector, (((Vout.Value).*(1-dutyVector).*dutyVector)./(L.Value*freq.Value)), 'b');%ILB
plot(dutyVector, ((((Vout.Value).*((1-dutyVector).^2).*dutyVector)./(2*L.Value*freq.Value))),'r');%IOB
plot(dutyCycle.Value, Iin, 'go');
plot(dutyCycle.Value, Iout, 'ko');
hold off;

text = findobj('Tag', 'textInformation');
text.String = ...
    sprintf('Information Panel\nL | %g \nFrequency | %g\nVOUT | %g\n Duty Cycle | %g\nRLOAD | %g'...
    ,L.Value,freq.Value,Vout.Value, dutyCycle.Value, Rload.Value);
end