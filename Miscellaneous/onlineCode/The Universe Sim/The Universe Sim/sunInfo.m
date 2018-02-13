function varargout = sunInfo(varargin)
% SUNINFO MATLAB code for sunInfo.fig
%      SUNINFO, by itself, creates a new SUNINFO or raises the existing
%      singleton*.
%
%      H = SUNINFO returns the handle to a new SUNINFO or the handle to
%      the existing singleton*.
%
%      SUNINFO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUNINFO.M with the given input arguments.
%
%      SUNINFO('Property','Value',...) creates a new SUNINFO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sunInfo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sunInfo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sunInfo

% Last Modified by GUIDE v2.5 15-Nov-2015 22:27:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sunInfo_OpeningFcn, ...
                   'gui_OutputFcn',  @sunInfo_OutputFcn, ...
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


% --- Executes just before sunInfo is made visible.
function sunInfo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sunInfo (see VARARGIN)

% Choose default command line output for sunInfo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sunInfo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sunInfo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function sName_CreateFcn(hObject, eventdata, handles)
sinfo = readFile('currentStar.txt'); %PLEASE NOTE THAT THE CODE DOES THE SAME THING FOR EACH INSTANCE
sName = ['Name: ' sinfo(1,:)]; % gets the name of the star and displays it on the info screen
set(hObject,'string',sName)
% hObject    handle to sName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function radius_CreateFcn(hObject, eventdata, handles)
sinfo = readFile('currentStar.txt');
sR = ['Radius(Km): ' sinfo(2,:)];
set(hObject,'string',sR)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function temperature_CreateFcn(hObject, eventdata, handles)
sinfo = readFile('currentStar.txt');
sT = ['Temperature(C): ', sinfo(3,:)];
set(hObject,'string',sT)
% hObject    handle to temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pNum_CreateFcn(hObject, eventdata, handles)
sinfo = readFile('currentStar.txt');
sM = ['Planets: ' sinfo(4,:)];
set(hObject,'string',sM)
% hObject    handle to pNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function mass_CreateFcn(hObject, eventdata, handles)
sinfo = readFile('currentStar.txt');
sM = ['Mass(Kg): ', sinfo(5,:)];
set(hObject,'string',sM)
% hObject    handle to mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
