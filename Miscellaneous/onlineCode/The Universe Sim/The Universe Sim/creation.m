

function varargout = creation(varargin)
% CREATION MATLAB code for creation.fig
%      CREATION, by itself, creates a new CREATION or raises the existing
%      singleton*.
%
%      H = CREATION returns the handle to a new CREATION or the handle to
%      the existing singleton*.
%
%      CREATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATION.M with the given input arguments.
%
%      CREATION('Property','Value',...) creates a new CREATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before creation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to creation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help creation

% Last Modified by GUIDE v2.5 27-Oct-2015 12:25:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @creation_OpeningFcn, ...
    'gui_OutputFcn',  @creation_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before creation is made visible.
function creation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to creation (see VARARGIN)
% Choose default command line output for creation
handles.output = hObject;


guidata(hObject, handles);

% UIWAIT makes creation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = creation_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
set(handles.pushbutton1, 'Enable', 'Off'); % hides the button
set(handles.pushbutton1, 'Visible', 'Off'); % hides the button
global currWindow;
%tPause = .05; % set time for frame delay
clear universe % makes sure that no existing universe exists
global uSize; % retrieves user inputted size of universe
global currSys; % creates a global variable to store the current system
universe = zeros(uSize,uSize,3); % creates blank universe
starCount = round(uSize/7)+ randi([round(-(uSize/15)),round(uSize/25)]); % calculates number of stars in the universe
if starCount < 0 % in case of error, insures that at least one star exists
    starCount = 1;
end
starExplored = zeros(starCount,1);
starCoordList = zeros(starCount,2); % creates a list to store the coordinates of all the stars
sysStor = zeros(uSize,uSize);
for i = 1:starCount % generate stars and displays them
    
    imshow(universe); % shows the stars as they are created
    starList(i) = Star(starCoordList,i); %#ok<AGROW> creates a new star
    starCoordList(i,:) = [starList(i).x,starList(i).y]; % gets the coordinates of the new star and stores them into the array
    for cx = starList(i).x-1:starList(i).x+1
        for cy = starList(i).y-1:starList(i).y+1
            universe(cx,cy,:) = starList(i).color(:)/255; % displays a star of the correct color
            if starList(i).type == 'black'
                universe(cx,cy,:) = [.5,.5,.5]; % displays a star of the correct color
            end
            
        end
    end
    for cx = starList(i).x-2:starList(i).x+2
        for cy = starList(i).y-2:starList(i).y+2
            sysStor(cx,cy) = starList(i).system; % saves the system that is stored in a certain location to be easily accessed
        end
    end
end


mainDisp = 1;
currWindow = 1;
while mainDisp == 1
    try
    [mY,mX] = myginput(1,'hand'); % gets mouse input so you can select a solar system
    mX = round(mX); % rounds the mouse x and y values to integers
    mY = round(mY);
    
    if sysStor(mX,mY) ~= 0 % detects wether or not a star was clicked
        currSys = sysStor(mX,mY);
        
        %sysArray(currSys) = System(cStar);
        
        if(starExplored(currSys) == 0) % checks to see if the system has already been created
            if starList(currSys).numPlanets>0 % sees if the star has planets
                pAltitudes = zeros(starList(currSys).numPlanets,1); % initializes an array to store all the planet altitudes
                for i = 1:starList(currSys).numPlanets
                    sysPArray(currSys,i) = Planet(starList(currSys),currSys,i,pAltitudes); % creates a planet
                    pAltitudes(i) = sysPArray(currSys,i).orbitAlt; % stores the altitude
                end
                systemView(starList,sysPArray); % opens up a view of the system
                starExplored(currSys) = 1;
            else
                systemView(starList); 
                starExplored(currSys) = 1;

            end
            
        else % loads a pre-existing system
            if starList(currSys).numPlanets>0
                systemView(starList,sysPArray);
            else
                systemView(starList);
            end
        end
        currWindow = 2;
        currSys = -1;
        clear mX
        clear mY
    end
    while currWindow == 2
        pause(1)
    end
    catch % if there is an error, just close program
        close
        mainDisp = 0;
    end
    
end
%{
while mainDisp == 1
    %[mY,mX] = ginput(1); % gets mouse input so you can select a wrench
    %mX = round(mX); % rounds the mouse x and y values to integers
    %mY = round(mY);
     
    
        
  
    for i = (starList(cSparkle).x)-1:(starList(cSparkle).x)+1
        for j = (starList(cSparkle).y)-1:(starList(cSparkle).y)+1
            if(i > 0 && i <dim(1)) && (j > 0 && j<dim(2))
                universe(i,j,:) = [0,0,0];
                universe(starList(cSparkle).x,starList(cSparkle).y,:) = starList(cSparkle).color(:);
            end
        end
    end
    cSparkle = randi([1,starCount]);
    spk = randi([1,8]);
    if spk == 1
        for i = (starList(cSparkle).x)-1:(starList(cSparkle).x)+1
            for j = (starList(cSparkle).y)-1:(starList(cSparkle).y)+1
                if(i > 0 && i <dim(1)) && (j > 0 && j<dim(2))
                    universe(i,j,:) = starList(cSparkle).color(:);
                end
            end
        end
    end
    
    imshow(universe);
    %pause(tPause);
    
end
%}


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
