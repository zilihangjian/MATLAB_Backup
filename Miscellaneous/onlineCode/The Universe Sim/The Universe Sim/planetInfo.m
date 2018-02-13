

function varargout = planetInfo(varargin)
%Displays a gui with the info of the called planet


% PLANETINFO MATLAB code for planetInfo.fig
%      PLANETINFO, by itself, creates a new PLANETINFO or raises the existing
%      singleton*.
%
%      H = PLANETINFO returns the handle to a new PLANETINFO or the handle to
%      the existing singleton*.
%
%      PLANETINFO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLANETINFO.M with the given input arguments.
%
%      PLANETINFO('Property','Value',...) creates a new PLANETINFO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before planetInfo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to planetInfo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help planetInfo

% Last Modified by GUIDE v2.5 16-Nov-2015 13:49:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @planetInfo_OpeningFcn, ...
                   'gui_OutputFcn',  @planetInfo_OutputFcn, ...
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


% --- Executes just before planetInfo is made visible.
function planetInfo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to planetInfo (see VARARGIN)

% Choose default command line output for planetInfo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes planetInfo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = planetInfo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pN = ['Name: ' pinfo((2+(14*(currBody-1))),:)]; % gets the info for the correct planet and displayes it
set(hObject,'string',pN)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function type_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pT = ['Type: ' pinfo((3+(14*(currBody-1))),:)];
set(hObject,'string',pT)
% hObject    handle to type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function atm_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pA = ['Atmosphere: ' pinfo((7+(14*(currBody-1))),:)];
set(hObject,'string',pA)
% hObject    handle to atm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function water_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pW = ['Water: ' pinfo((8+(14*(currBody-1))),:)];
set(hObject,'string',pW)
% hObject    handle to water (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function orbitAlt_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pO = ['Orbit Altitude(km): ' pinfo((6+(14*(currBody-1))),:)];
set(hObject,'string',pO)
% hObject    handle to orbitAlt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function radius_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pR = ['Radius(km): ' pinfo((4+(14*(currBody-1))),:)];
set(hObject,'string',pR)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function mass_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pM = ['Mass(kg): ' pinfo((5+(14*(currBody-1))),:)];
set(hObject,'string',pM)
% hObject    handle to mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function life_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pL = ['Life: ' pinfo((9+(14*(currBody-1))),:)];
set(hObject,'string',pL)
% hObject    handle to life (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function dayL_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pD = ['Day(Hours): ' pinfo((10+(14*(currBody-1))),:)];
set(hObject,'string',pD)
% hObject    handle to dayL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function yearL_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pY = ['Year(days): ' pinfo((11+(14*(currBody-1))),:)];
set(hObject,'string',pY)
% hObject    handle to yearL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function nMoon_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pNM = ['Moons: ' pinfo((12+(14*(currBody-1))),:)];
set(hObject,'string',pNM)
% hObject    handle to nMoon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function albedo_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pAl = ['Albedo: ' pinfo((13+(14*(currBody-1))),:)];
set(hObject,'string',pAl)
% hObject    handle to albedo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function temp_CreateFcn(hObject, eventdata, handles)
global currBody;
pinfo = readFile('currentPlanets.txt');
pTemp = ['Temperature(C): ' pinfo((14+(14*(currBody-1))),:)];
set(hObject,'string',pTemp)
% hObject    handle to temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
