function [] = GUI()
%function [] = GUI()
%Generates the Direction Finding GUI
%#ok<*NASGU>
%#ok<*DSTRVCT>
close all; clc; clear;

%--------------------------------------------------------------------------
%Figure
%--------------------------------------------------------------------------
DF_GUI = figure(...
    'Name', 'Direction Finding Simulation',....
    'Menubar','none',...
    'Position', get(0,'Screensize'),...
    'units', 'normalized',...
    'Resize', 'off');
guiAxesH = axes(...
    'units','normalized',...
    'position',[0 0 1 1],...
    'handlevisibility','off',...
    'visible','off');
movegui(DF_GUI,'center');
colormap summer;

%--------------------------------------------------------------------------
%UI PANELS
%--------------------------------------------------------------------------

%Control Panel on the right side of the GUI. This panel contains most of
%the parameters for running the program. Contains the information panel,
%data folder panel, simulation panel, data panel, and parameter panel
controlPanel = uipanel(...
    'Parent', DF_GUI,...
    'Title','Controls',...
    'FontSize', 12,...
    'BorderType', 'etchedin',...
    'Tag','controlPanel',...
    'Position',[0.750, 0.010, 0.24, 0.990]);
set(controlPanel, 'units', 'normalized');

%Contains the three difference tabs and axis for plotting the different
%graphs
graphPanel = uipanel(...
    'Parent', DF_GUI,...
    'Title', 'Visualization',...
    'FontSize', 12,...
    'BorderType', 'etchedin',...
    'Tag', 'graphPanel',...
    'Position',[.010, 0.010, 0.73 ,0.990]);
set(graphPanel, 'units', 'normalized');

%Contains the information and relevant items to determine the data folder
%location for accessing the data for the simulationa and data plot
dataFolderPanel = uipanel(...
    'Parent', controlPanel,...
    'Title', 'Data Folder',...
    'FontSize', 10,...
    'BorderType', 'etchedin',...
    'Tag', 'dataFolderPanel',...
    'Position', [0.0, 0.850, 1.00 ,0.15]);
set(dataFolderPanel, 'units', 'normalized');

%Contains the parameters for running a monte carlo simulation with the
%direction finding data supplied to it
dataPanel = uipanel(...
    'Parent', controlPanel,...
    'Title', 'Data Input',...
    'FontSize', 10,...
    'BorderType', 'etchedin',...
    'Tag', 'dataPanel',...
    'Position', [0.00, 0.64, 1.00, 0.20]);
set(dataPanel, 'units', 'normalized');

%Contains the parameters for visualizing the data for a direction finder
simulationPanel = uipanel(...
    'Parent', controlPanel,...
    'Title', 'Simulation Input',...
    'FontSize', 10,...
    'BorderType', 'etchedin',...
    'Tag', 'simulationPanel',...
    'Position', [0.00, 0.43, 1.00, 0.20]);
set(dataPanel, 'units', 'normalized');

%Contains the parameters for certain algorithm specifications
parametersPanel = uipanel(...
    'Parent', controlPanel,...
    'Title', 'Parameters',...
    'FontSize', 10,...
    'BorderType', 'etchedin',...
    'Tag', 'parametersPanel',...
    'Position', [0.00, 0.22, 1.00, 0.20]);
set(parametersPanel, 'units', 'normalized');

%Used for displaying information at the bottom of the control panel.
textPanel = uipanel(...
    'Parent', controlPanel,...
    'Title', '',...
    'FontSize', 10,...
    'BorderType', 'none',...
    'Tag', 'textPanel',...
    'Position', [0.00, 0.010, 1.00, 0.21]);
set(textPanel, 'units', 'normalized');

%--------------------------------------------------------------------------
%Data Folder Panel
%--------------------------------------------------------------------------

%Data Folder Text
dataFolder = uicontrol(...
    'Parent', dataFolderPanel,...
    'Style', 'text',...
    'Units','centimeters',...
    'Position',[1.00, 1.00, 7.00, 0.70],...
    'FontSize',8,...
    'String','',...
    'Tag', 'dataFolder');
set(dataFolder, 'Units','normalized');

%Data Folder Pushbutton
dataButton = uicontrol(...
    'Parent', dataFolderPanel,...
    'Style', 'pushbutton',...
    'Units','centimeters',...
    'Position',[0.00, 0.00, 2.00 ,0.50],...
    'FontSize',8,...
    'String','Data Folder',...
    'Tag', 'dataButton',...
    'CallBack', @dataLocation);
set(dataButton, 'units', 'normalized');

executeButton = uicontrol(...
    'Parent', dataFolderPanel,...
    'Style', 'pushbutton',...
    'Units','centimeters',...
    'Position',[6.40, 0.00, 2.00 ,0.50],...
    'FontSize',8,...
    'String','Execute',...
    'Tag', 'executeButton',...
    'CallBack', @execute);
set(executeButton, 'units', 'normalized');

%--------------------------------------------------------------------------
%Data Panel
%--------------------------------------------------------------------------

%Input text box for the data set string
dataSetTextbox = uicontrol(...
    'Parent', dataPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize',8,...
    'String','Data Set String',...
    'Tag', 'dataSetTextbox',...
    'Position', [0.00, 2.750, 2.50, 0.50]);
set(dataSetTextbox, 'units', 'normalized');

%Pushbutton to confirm the string of the data set
confirmDataSet = uicontrol(...
    'Parent', dataPanel,...
    'Style','pushbutton',...
    'Units', 'centimeters',...
    'FontSize', 8,...
    'String', '#',...
    'Position', [2.50, 2.750, 0.50, 0.50],...
    'Tag', 'confirmDataSet',...
    'CallBack', @checkDataInput);
set(confirmDataSet, 'units', 'normalized');

%Text indicates the start entry popup menu
startText = uicontrol(...
    'Parent',dataPanel,...
    'Style', 'text',...
    'Tag', 'startText',...
    'Units', 'centimeters',...
    'String', 'Start',...
    'Position', [0, 2.00, 1.250, 0.50]);
set(startText, 'units', 'normalized');

%Text indicates the end entry popup menu
endText = uicontrol(...
    'Parent', dataPanel,...
    'Style', 'text',...
    'Tag', 'endText',...
    'Units', 'centimeters',...
    'String', 'End',...
    'Position', [2.00, 2.00, 1.250, 0.50]);
set(endText, 'units', 'normalized');

%Popup for the starting value for the data set
startDataSet = uicontrol(...
    'Parent', dataPanel,...
    'Style', 'popup', ...
    'Tag', 'startDataSet',...
    'Units', 'centimeters',...
    'String', {'Data Set'},...
    'Position', [0.00, 1.50, 2.00, 0.50],...
    'Callback', @startEntry);
set(startDataSet, 'units', 'normalized');

%Popup for the ending value for the data set
endDataSet = uicontrol(...
    'Parent', dataPanel,...
    'Style', 'popup', ...
    'Tag', 'endDataSet',...
    'Units', 'centimeters',...
    'String', {'Data Set'},...
    'Position', [2.00, 1.50, 2.00, 0.50]);
set(endDataSet, 'units', 'normalized');

%Algorithms for the data in the application
algorithms = uicontrol(...
    'Parent', dataPanel,...
    'Style', 'popup', ...
    'Tag', 'algorithms',...
    'Units', 'centimeters',...
    'Position', [0.00, 0.50, 3.00, 0.50],...
    'CallBack', @algorithmDetermination,...
    'UserData', 'Least Squares',...
    'String', {'Least Squares', 'Maximum Likelihood', 'Gauss Newton'});
set(algorithms, 'units', 'normalized');
%--------------------------------------------------------------------------
%Simulation Panel
%--------------------------------------------------------------------------

%Contains the static text above the simulations input text box
simulationCheckBox = uicontrol(...
    'Parent',simulationPanel,...
    'Style', 'checkbox',...
    'Tag', 'simulationCheckBox',...
    'Units', 'centimeters',...
    'String', 'Simulations',...
    'FontSize', 8,...
    'Value', 0,...
    'Position', [0.00, 2.750, 2.00, 0.50]);
set(simulationCheckBox, 'units', 'normalized');

%Textbox for input of integer value representing the number of simulations
simulationsInput = uicontrol(...
    'Parent', simulationPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','# of simulations',...
    'Tag', 'simulationInput',...
    'Position', [0.00, 2.25, 3.00, 0.50]);
set(simulationsInput, 'units', 'normalized');

%Contains the static text indicates the location of the transmitter
%location text boxes
transmitterText = uicontrol(...
    'Parent', simulationPanel,...
    'Style', 'text',...
    'Tag', 'transmitterText',...
    'Units', 'centimeters',...
    'String', 'Transmitter Location',...
    'Position', [-0.200, 1.50, 4.00, 0.50]);
set(transmitterText, 'units', 'normalized');

%Transmitter Location X coordinate textbox input
transmitterLocationX = uicontrol(...
    'Parent', simulationPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','Longitude',...
    'Tag', 'transmitterLocationX',...
    'Position', [0.00, 1.00, 2.00, 0.50]);
set(transmitterLocationX, 'units', 'normalized');

%Transmitter Location Y coordinate textbox input
transmitterLocationY = uicontrol(...
    'Parent', simulationPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','Latitude',...
    'Tag', 'transmitterLocationY',...
    'Position', [2.00, 1.00, 2.00, 0.50]);
set(transmitterLocationY, 'units', 'normalized');

%Popup for inputting the percent error to run the simulation
errorMenu = uicontrol(...
    'Parent', simulationPanel,...
    'Style', 'popup', ...
    'Tag', 'errorMenu',...
    'Units', 'centimeters',...
    'String', {''},...
    'Value', 5,...
    'Position', [0.00, 0.25, 2.00, 0.50]);
set(errorMenu, 'units', 'normalized');
generateErrorValues();


%--------------------------------------------------------------------------
%Parameter Panel
%--------------------------------------------------------------------------

%Static Text for the indiciates the MLE Parameters
MLE_Text = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'text',...
    'Tag', 'MLE_Text',...
    'Units', 'centimeters',...
    'String', 'MLE',...
    'Position', [0.50, 2.750, 1.00, 0.50]);
set(MLE_Text, 'units', 'normalized');

gridSizeMLE = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize',8,...
    'String','MLE Grid Size',...
    'Position', [0.00, 2.250, 2.00, .50],...
    'Tag', 'gridSizeMLE');
set(gridSizeMLE, 'units', 'normalized');

minXGrid = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize',8,...
    'String','Min X',...
    'Position', [0.00, 1.750, 1.00, 0.50],...
    'Tag', 'minXGrid');
set(minXGrid, 'units', 'normalized');

maxXGrid = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize',8,...
    'String','Max X',...
    'Position', [1.00, 1.750, 1.00, 0.50],...
    'Tag', 'maxXGrid');
set(maxXGrid, 'units', 'normalized');

minYGrid = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize',8,...
    'String','Min Y',...
    'Position', [0.00, 1.250, 1.00, 0.50],...
    'Tag', 'minYGrid');
set(minYGrid, 'units', 'normalized');

maxYGrid = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize',8,...
    'String','Max Y',...
    'Position', [1.00, 1.250, 1.00, 0.50],...
    'Tag', 'maxYGrid');
set(maxYGrid, 'units', 'normalized');

iterativeMethodText = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'text',...
    'Tag', 'MLE_Text',...
    'Units', 'centimeters',...
    'String', 'Iterative Method',...
    'Position', [3.25, 2.850, 3.00, 0.400]);
set(iterativeMethodText, 'units', 'normalized');

guessLongitude = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','Longitude',...
    'Tag', 'guessLongitude',...
    'Position', [2.75, 2.240, 1.90, 0.50]);
set(guessLongitude, 'units', 'normalized');

%Transmitter Location Y coordinate
guessLatitude = uicontrol(...
    'Parent', parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','Latitude',...
    'Tag', 'guessLatitude',...
    'Position', [4.65, 2.240, 1.90, 0.50]);
set(guessLatitude, 'units', 'normalized');

toleranceInput = uicontrol(...
    'Parent',parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','Tolerance',...
    'Tag', 'toleranceInput',...
    'Position', [2.75, 1.740, 1.90, 0.50]);
set(toleranceInput, 'units', 'normalized');

iterationsInput = uicontrol(...
    'Parent',parametersPanel,...
    'Style', 'edit',...
    'Units','centimeters',...
    'FontSize', 8,...
    'String','Iterations',...
    'Tag', 'iterationsInput',...
    'Position', [4.65, 1.740, 1.90, 0.50]);
set(iterationsInput, 'units', 'normalized');

%--------------------------------------------------------------------------
%Text Panel
%--------------------------------------------------------------------------

textInformation = uicontrol(...
    'Parent', textPanel,...
    'Style', 'edit',...
    'String', 'Information Panel',...
    'Units', 'centimeter',...
    'Enable', 'inactive',...
    'BackgroundColor', 'white',...
    'Tag', 'textInformation',...
    'Min', 0,...
    'Max', 1000000,...
    'HorizontalAlignment','left',...
    'Position', [0.00,0.00, 8.50,4.00]);

%--------------------------------------------------------------------------
%Graph Panel
%--------------------------------------------------------------------------

%UI TABS
tabgroup = uitabgroup(...
    'Parent', graphPanel,...
    'Tag', 'TabGroup');

dataTab = uitab(...
    'Parent', tabgroup,...
    'Title', 'Data Plot',...
    'Tag', 'dataTab');
LS_Tab = uitab(...
    'Parent', tabgroup,...
    'Title', 'Least Squares Plot',...
    'Tag', 'LS_Tab');
MLE_Tab = uitab(...
    'Parent', tabgroup,...
    'Title', 'Maximum Likelihood Plot',...
    'Tag', 'MLE_Tab');
GN_Tab = uitab(...
    'Parent', tabgroup,...
    'Title', 'Gauss Newton Plot',...
    'Tag', 'GN_Tab');
CRLB_Tab = uitab(...
    'Parent', tabgroup,...
    'Title', 'Cramer Rao Lower Bound',...
    'Tag', 'CRLB_Tab');
CE_Tab = uitab(...
    'Parent', tabgroup,...
    'Title', 'Confidence Ellipse',...
    'Tag', 'CE_Tab');

popoutButton = uicontrol(...
    'Parent', graphPanel,...
    'Units', 'centimeter',...
    'Tag', 'popoutButton',...
    'CallBack', @popout,...
    'String', 'Popout',...
    'Position', [24,18.25,2,0.50]);

%Handles Creation
handles = guihandles(DF_GUI);
guidata(DF_GUI, handles);
end
%--------------------------------------------------------------------------
%Sub Functions
%--------------------------------------------------------------------------

function [] = dataLocation(hObject, eventdata) %#ok<*INUSD>
%function [] = dataLocation(hObject,eventdata)
%Callback function for the data folder push button that determines the
%location of the data folder. The user can select a folder that contains
%the data for the GUI. It also sets a textlabel with the path to the data
%folder so the user can verify the path
handles = guidata(gcbo);
data_folder = uigetdir();
textLabel = sprintf('%s', data_folder);
set(handles.dataFolder, 'String', textLabel);
guidata(gcbo, handles);%update the figure handles
end

function [] = checkDataInput(hObject, eventdata)
% function [] = checkDataInput(hObject, eventdata)
%Callback function for the pushbutton next to the text field to verify that
%the data string for the data.mat file is correct or visible within the
%data folder. This function checks for if a simulation or data object was
%used and then changes to the directory and loads the file. It then returns
%to the original directory and determines the number of data points
%possible and populates the popup menu with those points

%Handle Determination
handles = guidata(gcbo);

%Data Access
currentLocation = pwd;%stores current location in a string
try
    cd(handles.dataFolder.String);%changes to the data location
    load(handles.dataSetTextbox.String);%loads the string from the textbox
    
    %Pop up menu Population
    %Creates a cell array of characters ranging from the 1 to N, where N is
    %the number of data points in the data set
    intVector = linspace(1, length(PlatLon), length(PlatLon));
    charArray = num2str(intVector(:));
    charCell = cellstr(charArray);
    handles.startDataSet.String = charCell;
    handles.endDataSet.String = 'Set Starting Point';
catch ME%Catches the exceptions for if the data folder isn't already set
    info = handles.textInformation;
    info.String = strvcat(info.String,ME.message);
    cd(currentLocation);
    return;
end
cd(currentLocation)
guidata(gcbo, handles);%update the figure handles
end

function [] = startEntry(hObject, eventdata)
% function [] = startEntry(hObject, eventdata)
%Called after the selection of the starting data value so that the end data
%value can be adjusted to reflect the initial change. This prevents having
%a starting value > ending value.
handles = guidata(gcbo);

endPoint = length(hObject.String);
dataVect = linspace(hObject.Value,endPoint, ((endPoint + 1) - hObject.Value));
charArray = num2str(dataVect(:));
charCell = cellstr(charArray);
handles.endDataSet.String = charCell;
handles.endDataSet.Value = 1;

guidata(gcbo, handles);%update the figure handles
end

function [] = algorithmDetermination(hObject,eventdata)
% function [] = algorithmDetermination(hObject, eventdata)
%Callback function for the algorithm popup menus to determine what the
%currently selected algorithm is. It then assigns the value to the UserData
%property of that object
hObject.UserData = hObject.String{hObject.Value};
end

function [] = execute(hObject, eventdata)
% function [] = dataPlot(hObject, eventdata)
handles = guidata(gcbo);
%Data Access
currentLocation = pwd;
%Used for if the data folder is unset
try
    cd(handles.dataFolder.String);
    load(handles.dataSetTextbox.String);%loads the values from the .mat file
catch ME
    info = handles.textInformation;
    info.String = strvcat(info.String,ME.message);
    cd(currentLocation);
    return;
end

%Used for if the Start or End Data Value is unset
try
    start = handles.startDataSet.Value;
    dataEndString = handles.endDataSet.String;%Char value before conversion
    dataEndValue = handles.endDataSet.Value;%Location in cell array
    duration = str2double(dataEndString{dataEndValue});
catch ME
    info = handles.textInformation;
    info.String = strvcat(info.String,'Start or Duration Values Unset');
    cd(currentLocation);
    guidata(gcbo, handles);%update the figure handles
    return;
end

cd(currentLocation);
[handles] = clearAxis(handles);
tabGroup = handles.TabGroup;%Used for changing the tabs depending on the plot

%Minimizes the following vectors and cell arrays to only contain the data
%specified by start and duration
[azimuth, theta, PlatLon, PlatLat, Type] = ...
    arrayMinimization(azimuth, theta, PlatLon, PlatLat, Type, start, duration); %#ok<NODEF>
if isempty(azimuth) || isempty(theta) || isempty(PlatLon) || isempty(PlatLat)...
        || isempty(Type)
    info = handles.textInformation;
    info.String = strvcat(info.String,'> PARAMETER ERROR');
    guidata(gcbo, handles);%update the figure handles
    return
end


if handles.simulationCheckBox.Value == 1
    %Get Values from simulationPanel
    %Values for the transmitter location
    testLocation = [str2double(handles.transmitterLocationX.String),...
        str2double(handles.transmitterLocationY.String)];
    numSim = str2double(handles.simulationInput.String);
    LOB_error = handles.errorMenu.Value / 100;
    if isnan(testLocation(1)) || isnan(testLocation(2)) || isnan(numSim)
        info = handles.textInformation;
        info.String = strvcat(info.String,'> SIMULATION PARAMETER UNSET');
        guidata(gcbo, handles);
        return;
    end
    %Plotting Elements
    tabGroup.SelectedTab = handles.CE_Tab;%Simulation Tab
    axis(handles.CE_Axes);%Sets the axes to simulationAxes
    
    %Update the information panel with relevant information
    [handles] = updateInformationPanel(handles, start, duration,...
        testLocation, LOB_error, numSim);
    
    %Algorithm Determination
    if strcmp(handles.algorithms.UserData,'Least Squares')
        %Least Squares Implementation
        [timeLength] = noisySimulation(PlatLon, PlatLat, testLocation, ...
            numSim, azimuth, 'LS', LOB_error, [], [], [], [], []);
        timeString = sprintf('> PROGRAM TIME: %g',timeLength);
        handles.textInformation.String = ...
            strvcat(handles.textInformation.String, timeString);
        
    elseif strcmp(handles.algorithms.UserData, 'Maximum Likelihood')
        %Maximum Likelihood
        [handles] = getMLEData(handles);
        yMax = str2double(handles.maxYGrid.String);
        yMin = str2double(handles.minYGrid.String);
        xMax = str2double(handles.maxXGrid.String);
        xMin = str2double(handles.minXGrid.String);
        gridSize = str2double(handles.gridSizeMLE.String);
        [timeLength] = noisySimulation(PlatLon, PlatLat, testLocation...
            , numSim, 'MLE', LOB_error,gridSize, xMin, xMax, yMin, yMax);
        timeString = sprintf('> PROGRAM TIME: %g',timeLength);
        handles.textInformation.String = ...
            strvcat(handles.TextInformation.String, timeString);
    else
        textInformation.String = strvcat(handles.textInformation.String,...
            'Simulation Algorithms: Least Squares, Maximum Likelihood');
    end
    
elseif handles.simulationCheckBox.Value == 0
    
    %Update the information panel with relevant information
    [handles] = updateInformationPanel(handles, start, duration,...
        transmitterLocation, [], []);
    
    %Plots the Line of Bearings for the original receiver data using the theta
    %values, then plots the position of the transmitter
    tabGroup.SelectedTab = handles.dataTab;
    axes(handles.dataAxes);
    plotLineBearings(PlatLon, PlatLat, theta, transmitterLocation, .05);
    
    if strcmp(handles.algorithms.UserData,'Least Squares')
        %Least Squares Implementation
        
        %Switches to Least Squares Plotting
        tabGroup.SelectedTab = handles.LS_Tab;
        axes(handles.LS_Axes);
        [LS_estimate, timeLength] = LS_2D(PlatLon, PlatLat, theta, transmitterLocation,...
            .05,Type);
        
        %Information Update
        estimateString = sprintf('> ESTIMATE: [%g, %g]',LS_estimate(1), ...
            LS_estimate(2));
        timeString = sprintf('> ALGORITHM TIME: %g',timeLength);
        handles.textInformation.String = strvcat(...
            handles.textInformation.String, estimateString, timeString);
        
    elseif strcmp(handles.algorithms.UserData, 'Maximum Likelihood')
        %Maximum Likelihood Implementation
        
        %Switches to Maximum Likelihood Plotting
        tabGroup.SelectedTab = handles.MLE_Tab;
        axes(handles.MLE_Axes);
        [handles] = getMLEData(handles);
        yMax = str2double(handles.maxYGrid.String);
        yMin = str2double(handles.minYGrid.String);
        xMax = str2double(handles.maxXGrid.String);
        xMin = str2double(handles.minXGrid.String);
        gridSize = str2double(handles.gridSizeMLE.String);
        [MLE_estimate, timeLength] = ...
            MLE_2D(azimuth, PlatLon, PlatLat, gridSize, yMin, yMax, xMin, xMax);
        
        %Information Update
        estimateString = sprintf('> ESTIMATE: [%g, %g]',MLE_estimate(1),...
            MLE_estimate(2));
        timeString = sprintf('> ALGORITHM TIME: %g',timeLength);
        handles.textInformation.String = strvcat(...
            handles.textInformation.String, estimateString, timeString);
        
    elseif strcmp(handles.algorithms.UserData, 'Gauss Newton')
        
        %Switches to Gauss Newton Plotting
        tabGroup.SelectedTab = handles.GN_Tab;
        axes(handles.GN_Axes);
        [handles] = getIMdata(handles);
        initialGuess = [str2double(handles.guessLongitude.String),...
            str2double(handles.guessLatitude.String)];
        iterations = str2double(handles.iterationsInput.String);
        tolerance = str2double(handles.toleranceInput.String);
        [GN_estimate, timeLength] = gaussNewton(PlatLon, PlatLat, initialGuess,...
            iterations, tolerance,theta, transmitterLocation);
        
        %Information Update
        estimateString = sprintf('> ESTIMATE: [%g, %g]',GN_estimate(1),...
            GN_estimate(2));
        timeString = sprintf('> ALGORITHM TIME: %g',timeLength);
        handles.textInformation.String = strvcat(...
            handles.textInformation.String, estimateString, timeString);
    end
    
end

end

function [] = popout(hObject, eventdata)
handles = guidata(gcbo);

if strcmp(handles.TabGroup.SelectedTab.Title, 'Data Plot')
    if ishandle(handles.dataAxes)
        popoutFigure = figure();
        set(popoutFigure, 'Position',get(0,'Screensize'));
        copyobj(handles.dataTab.Children, popoutFigure);
    end
elseif strcmp(handles.TabGroup.SelectedTab.Title, 'Least Squares Plot')
    if ishandle(handles.LS_Axes)
        popoutFigure = figure();
        set(popoutFigure, 'Position',get(0,'Screensize'));
        copyobj(handles.LS_Tab.Children, popoutFigure);
    end
elseif strcmp(handles.TabGroup.SelectedTab.Title, 'Maximum Likelihood Plot')
    if ishandle(handles.MLE_Axes)
        popoutFigure = figure();
        set(popoutFigure, 'Position',get(0,'Screensize'));
        copyobj(handles.MLE_Tab.Children, popoutFigure);
    end
elseif strcmp(handles.TabGroup.SelectedTab.Title, 'Gauss Newton Plot')
    if ishandle(handles.GN_Axes)
        popoutFigure = figure();
        set(popoutFigure, 'Position',get(0,'Screensize'));
        copyobj(handles.GN_Tab.Children, popoutFigure);
    end
    
elseif strcmp(handles.TabGroup.SelectedTab.Title, 'Cramer Rao Lower Bound')
    if ishandle(handles.CRLB_Axes)
        popoutFigure = figure();
        set(popoutFigure, 'Position',get(0,'Screensize'));
        copyobj(handles.CRLB_Tab.Children, popoutFigure);
    end
    
elseif strcmp(handles.TabGroup.SelectedTab.Title, 'Confidence Ellipse')
    if ishandle(handles.CE_Axes)
        popoutFigure = figure();
        set(popoutFigure, 'Position',get(0,'Screensize'));
        copyobj(handles.CE_Tab.Children, popoutFigure);
    end
end
end

function [handles] = clearAxis(handles)
% function [handles] = clearAxis(handles)

%Data Axes
if isempty(findobj('Tag', 'dataAxes'))
    dataAxes = axes('Parent', handles.dataTab, 'Tag', 'dataAxes');
    handles.dataAxes = dataAxes;
else
    cla(handles.dataAxes);
    %     reset(handles.dataAxes);
end

%Least Squares Axes
if isempty(findobj('Tag', 'LS_Axes'))
    LS_Axes = axes('Parent', handles.LS_Tab, 'Tag','LS_Axes');
    handles.LS_Axes = LS_Axes;
else
    cla(handles.LS_Axes);
    %     reset(handles.LS_Axes);
end

%Maximum Likelihood Axes
if isempty(findobj('Tag', 'MLE_Axes'))
    MLE_Axes = axes('Parent', handles.MLE_Tab, 'Tag', 'MLE_Axes');
    handles.MLE_Axes = MLE_Axes;
else
    cla(handles.MLE_Axes);
    %     reset(handles.MLE_Axes);
end

%Gauss Newton Axes
if isempty(findobj('Tag', 'GN_Axes'))
    GN_Axes = axes('Parent', handles.GN_Tab, 'Tag', 'GN_Axes');
    handles.GN_Axes = GN_Axes;
else
    cla(handles.GN_Axes);
    %     reset(handles.GN_Axes);
end

%CRLB Axes
if isempty(findobj('Tag', 'CRLB_Axes'))
    CRLB_Axes = axes('Parent', handles.CRLB_Tab, 'Tag','CRLB_Axes');
    handles.CRLB_Axes = CRLB_Axes;
else
    cla(handles.CRLB_Axes);
    %     reset(handles.CRLB_Axes);
end

%Confidence Ellipse Axes
if isempty(findobj('Tag', 'CE_Axes'))
    CE_Axes = axes('Parent', handles.CE_Tab, 'Tag', 'CE_Axes');
    handles.CE_Axes = CE_Axes;
else
    cla(handles.CE_Axes);
    %     reset(handles.CE_Axes);
end

guidata(gcbo, handles);
end

function [handles] = getMLEData(handles)
% function [handles] = getMLEData(handles)
if isnan(str2double(handles.gridSizeMLE.String))
    handles.gridSizeMLE.String = 200;
end

if isnan(str2double(handles.maxYGrid.String))
    handles.maxYGrid.String = 33.10;
end

if isnan(str2double(handles.minYGrid.String))
    handles.minYGrid.String = 33.00;
end

if isnan(str2double(handles.maxXGrid.String))
    handles.maxXGrid.String = -111.30;
end

if isnan(str2double( handles.minXGrid.String))
    handles.minXGrid.String = -111.40;
end
guidata(gcbo, handles);
end

function [] = generateErrorValues()
% function [] = generateErrorValues()
errorMenu = findobj('Tag','errorMenu');
values = linspace(1,100,100);
charArray = num2str(values(:));
charCell = cellstr(charArray);
errorValues = cell(1,length(values));
for i = 1: length(errorValues)
    errorValues{i} = strcat(charCell{i}, ' DEG');
end
errorMenu.String = errorValues;
end

function [handles] = updateInformationPanel(handles, start, duration,...
    transmitter, LOB_error, numSim)
%function [handles] = updateInformationPanel(handles, start, duration,...
%       testLocation, LOB_error, numSim)

info = handles.textInformation;
if handles.simulationCheckBox.Value == 1
    lengthString = sprintf('> START: %d | END: %d ', start, duration);
    transmitterString = sprintf('> TRANSMITTER LOCATION: [%g, %g]',...
        transmitter(1), transmitter(2));
    errorString = sprintf('> ERROR: %g', LOB_error);
    simulationString = sprintf('> SIMULATIONS: %g',numSim);
    info.String = strvcat(info.String,'> SIMULATION', lengthString, ...
        transmitterString, errorString, simulationString);
else
    lengthString = sprintf('> START: %d | END: %d ', start, duration);
    transmitterString = sprintf('> TRANSMITTER LOCATION: [%g, %g]',...
        transmitter(1), transmitter(2));
    info.String = strvcat(info.String,'> DATA PLOT', lengthString, ...
        transmitterString);
end
guidata(gcbo, handles);
end

function [handles] = getIMdata(handles)
%function [handles] = getIMdata(handles)
if isnan(str2double(handles.guessLongitude.String)) ||...
        isnan(str2double(handles.guessLatitude.String))
    handles.guessLongitude.String = -111;
    handles.guessLatitude.String = 33;
end

if isnan(str2double(handles.iterationsInput.String))
    handles.iterationsInput.String = 25;
end

if isnan(str2double(handles.toleranceInput.String))
    handles.toleranceInput.String = 1e-3;
end
guidata(gcbo, handles);
end