
function varargout = TheUniverseSim(varargin)
% THEUNIVERSESIM MATLAB code for TheUniverseSim.fig
%      THEUNIVERSESIM, by itself, creates a new THEUNIVERSESIM or raises the existing
%      singleton*.
%
%      H = THEUNIVERSESIM returns the handle to a new THEUNIVERSESIM or the handle to
%      the existing singleton*.
%
%      THEUNIVERSESIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THEUNIVERSESIM.M with the given input arguments.
%
%      THEUNIVERSESIM('Property','Value',...) creates a new THEUNIVERSESIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TheUniverseSim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TheUniverseSim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TheUniverseSim

% Last Modified by GUIDE v2.5 30-Nov-2015 13:15:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @TheUniverseSim_OpeningFcn, ...
    'gui_OutputFcn',  @TheUniverseSim_OutputFcn, ...
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


% --- Executes just before TheUniverseSim is made visible.
function TheUniverseSim_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TheUniverseSim (see VARARGIN)

% Choose default command line output for TheUniverseSim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes TheUniverseSim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TheUniverseSim_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
global uSize;
uSize = str2num(get(hObject,'String')); %gets the inputted size 
data = struct('uSize',uSize);
hObject.UserData = data;
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
data = struct('uSize',0);
hObject.UserData = data;
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
h = findobj('Tag','edit1');
data = h.UserData;
global uSize;

if uSize ~=0 && uSize >= 100 && uSize<=800
close
creation; % if the inputted size is within range, generates the universe
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in InstructionButton.
function InstructionButton_Callback(hObject, eventdata, handles)

InstructionView;

% hObject    handle to InstructionButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
