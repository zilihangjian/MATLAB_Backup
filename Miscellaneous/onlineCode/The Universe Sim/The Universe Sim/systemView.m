




function varargout = systemView(varargin)

%{
Creates the gui to enable the user to view the selected system
%}



% SYSTEMVIEW MATLAB code for systemView.fig
%      SYSTEMVIEW, by itself, creates a new SYSTEMVIEW or raises the existing
%      singleton*.
%
%      H = SYSTEMVIEW returns the handle to a new SYSTEMVIEW or the handle to
%      the existing singleton*.
%
%      SYSTEMVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYSTEMVIEW.M with the given input arguments.
%
%      SYSTEMVIEW('Property','Value',...) creates a new SYSTEMVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before systemView_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to systemView_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help systemView

% Last Modified by GUIDE v2.5 22-Nov-2015 12:32:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @systemView_OpeningFcn, ...
    'gui_OutputFcn',  @systemView_OutputFcn, ...
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


% --- Executes just before systemView is made visible.
function systemView_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to systemView (see VARARGIN)

% Choose default command line output for systemView
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%{
sCol = randColor; % PREMADE SOLAR SYSTEM FOR TESTING
starTex = sunTex(sCol*255,'norml');
pTex = planTex('rock',1,1,5);
p2Tex = planTex('gass',1,1,5);
p3Tex = planTex('rock',0,0,2);
p4Tex = planTex('rock',1,0,0);
p5Tex = planTex('rock',0,0,0);
[x,y,z] = sphere(100);

s = warp(x*10,y*10,z*10,starTex);
set(s,'edgecolor','none','DiffuseStrength',1,'SpecularStrength',1);
light('Position',[-1 0 0],'Style','local','Color',sCol)

axis equal;
axis off;
hold on

a(1) = warp(x*4+20,y*4,z*4,pTex);
circle(0,0,20);
a(2) = warp(x*7-40,y*7,z*7,p2Tex);
circle(0,0,40);
a(3) = warp(x*3,y*3+60,z*3,p3Tex);
circle(0,0,60);
a(4) = warp(x*5,y*5-80,z*5,p4Tex);
circle(0,0,80);
a(5) = warp(x*1.3-29,y*1.3,z*1.3,p5Tex);
circle(-40,0,11);

for i = 1:5
    set(a(i),'backfacelighting', 'lit', 'edgecolor','none','DiffuseStrength',1-i/10,'SpecularStrength',0);
end
%}

%{


numP = randi([2,7]); % RANDOM SOLAR SYSTEM NOT BASED UPON PHYSICS
[x,y,z] = sphere(100);
alt = 20;
sCol = randColor;
starTex = sunTex(sCol*255,'norml');
s = warp(x*15,y*15,z*15,starTex);
set(s,'edgecolor','none','DiffuseStrength',1,'SpecularStrength',1);
light('Position',[-1 0 0],'Style','local','Color',sCol)
hold on
axis equal;
axis off;
for i = 1:numP
    if randi([0,1]) == 1
        pTex = planTex('gass',0,0,0);
    else
        pTex = planTex('rock',randi([0,1]),randi([0,1]),randi([0,5]));
    end
    
    r = randi([5,12]);
    alt = alt+50;
    [a,b] = calcXY(alt);
    
    b(i) = warp((x*r)+a,(y*r)+b,z*r,pTex);
    circle(0,0,alt);
    set(b(i),'backfacelighting', 'lit', 'edgecolor','none','DiffuseStrength',1-i/(numP+4),'SpecularStrength',0);
end
rotate3d
hold off
%}
%%%%%%%%%FINAL SOLAR SYSTEM VIEW CODE 

global currSys;
starArray = varargin{1}; %gets the stararray from the variable number of arguments
if nargin>1
    pArray = varargin{2}; %gets the planet array 
end

data = struct('sun',starArray(currSys),'pList',pArray);
hObject.UserData = data;

global currNumP;
currNumP = starArray(currSys).numPlanets; %gets the number of planets in the system
[x,y,z] = sphere(100); %generates a sphere with 100 faces
%rConRate = 1500;
rConRate = 200; %conversion ratio from real size to display size
if(starArray(currSys).type == 'black') % sets special conversions for stars so that they display well
    sR = starArray(currSys).radius/(rConRate*.3);
elseif starArray(currSys).type == 'dwarf'
    sR = starArray(currSys).radius/(rConRate);
elseif starArray(currSys).type == 'giant'
    sR = starArray(currSys).radius/(rConRate*15);
else
    sR = starArray(currSys).radius/(rConRate*5);
end
s = warp(x*sR,y*sR,z*sR,starArray(currSys).appearance); % displays the star within the system
if(starArray(currSys).type == 'black')
    set(s,'edgecolor','w','DiffuseStrength',1,'SpecularStrength',1); %sets special light properties for stars
else
    set(s,'edgecolor','none','DiffuseStrength',1,'SpecularStrength',1);
end
%light('Position',[0 0 0],'Style','local','Color',starArray(currSys).color);
light('Position',[-1 0 0],'Style','local')
axis equal;
axis off;
hold on
altConRate = 250000; % sets conversion rate from real altitude to display altitude

for i = 1:starArray(currSys).numPlanets
    [a,b] = calcXY(pArray(currSys,i).orbitAlt/altConRate);
    dispAlt = round(pArray(currSys,i).orbitAlt(1)/altConRate);
    dispR = round(pArray(currSys,i).radius/rConRate);
    plan(i) = warp(x*dispR+a,y*dispR+b,z*dispR,pArray(currSys,i).texture);
    circle(0,0,dispAlt);
    set(plan(i),'backfacelighting', 'lit', 'edgecolor','none','DiffuseStrength',1,'SpecularStrength',0)
end

hold off;
rotate3d

delete('currentStar.txt'); %enables the program to store the system within a text file so it may be read later
fid=fopen('currentStar.txt','wt');
fprintf(fid,'%s\n', starArray(currSys).name); %saves star info to txt file
fprintf(fid,'%.2e\n', starArray(currSys).radius);
fprintf(fid,'%.2e\n', starArray(currSys).temperature);
fprintf(fid,'%.0f\n', starArray(currSys).numPlanets);
fprintf(fid,'%.2e\n', starArray(currSys).mass);
fclose(fid);
if starArray(currSys).numPlanets > 0 %saves planet info to text file
    fid = fopen('currentPlanets.txt','wt');
    for i = 1:starArray(currSys).numPlanets
        fprintf(fid, '%.0f\n',i);
        fprintf(fid, '%s\n',pArray(currSys,i).name);
        fprintf(fid, '%s\n',pArray(currSys,i).type);
        fprintf(fid, '%.2e\n',pArray(currSys,i).radius);
        fprintf(fid, '%.2e\n',pArray(currSys,i).mass);
        fprintf(fid, '%.2e\n',pArray(currSys,i).orbitAlt);
        fprintf(fid, '%.0f\n',pArray(currSys,i).atmosphere);
        fprintf(fid, '%.0f\n',pArray(currSys,i).water);
        fprintf(fid, '%.0f\n',pArray(currSys,i).life);
        fprintf(fid, '%.0f\n',pArray(currSys,i).day);
        fprintf(fid, '%.0f\n',pArray(currSys,i).year);
        fprintf(fid, '%.0f\n',pArray(currSys,i).numMoons);
        fprintf(fid, '%.5f\n',pArray(currSys,i).albedo);
        fprintf(fid, '%.0f\n',pArray(currSys,i).temperature); 
        fprintf(fid, '\n');
    end
    fclose(fid);
end

%sunName = readFile('currentStar.txt');








function [x,y] = calcXY(h)

h = round(h(1));
x = randi([0,round(h)]);
y = round(sqrt((h^2)-(x^2)));

if randi([0,1]) ==0
    x = x*(-1);
end
if randi([0,1]) ==0
    y = y*(-1);
end



function circle(x,y,r)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
ang=0:0.01:2*pi;
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp,'LineStyle','-','LineWidth',.5);
% UIWAIT makes systemView wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = systemView_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in closeButton.
function closeButton_Callback(hObject, eventdata, handles)
global currWindow;
currWindow = 1;
close
% hObject    handle to closeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)




% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in rotButton.
function rotButton_Callback(hObject, eventdata, handles)
zoom off;
rotate3d on;

% hObject    handle to rotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in zoomButton.
function zoomButton_Callback(hObject, eventdata, handles)
rotate3d off;
zoom on;
% hObject    handle to zoomButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
global currBody;
currBody = str2num(get(hObject,'String'));
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)


% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global currBody;
global currNumP;

if currBody > 0 && currBody <= currNumP
    planetInfo;
elseif currBody == 0
    sunInfo;
end
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global currWindow;
currWindow = 1;
% Hint: delete(hObject) closes the figure
delete(hObject);
