function [] = lossy_wave_prop(material, freq)
% function [] = losey_wave_prop(material, freq)
%Example Function Calls
% lossy_wave_prop(1,1e7);Tests Calcium
% lossy_wave_prop(2,1e7);Tests Mercury 
% lossy_wave_prop(3,1e6);%Tests Air
close all; clc;
%Material Properties
ur = 1;%Assuming non magnetic properties of the materials
u0 = pi*4e-7; %Permability Constant | https://en.wikipedia.org/wiki/Permeability_(electromagnetism)
e0 = 8.854e-12; %Vacuum Constant | https://en.wikipedia.org/wiki/Vacuum_permittivity

%http://www.clippercontrols.com/pages/Dielectric-Constant-Values.html
erCalc = 3.0;%Calcium
erMerc = 1.0074;%Mercury
erAir = 1;%Air
er = [3.0, 1.0074, 1];
%https://www.thebalance.com/electrical-conductivity-in-metals-2340117
%Conductivity Values for Various Materials
condCalc = 2.82e7;%Calcium
condMerc = 1.02e6;%Mercury
condAir = 5e-15;%Air
cond = [condCalc, condMerc, condAir];

%Variable Declarations
vPropCalc = (sqrt(ur*u0*e0.*erCalc)).^-1;%velocity of propagation in Calcium
vPropMerc = (sqrt(ur*u0*e0.*erMerc)).^-1;%velocity of propagation in Mercury
vPropAir = (sqrt(ur*u0*e0.*erAir)).^-1;%velocity of propagation in Air

%Frequency Setup
omega = 2*pi*freq;%Angular Frequency

%Alpha Values
A = sqrt(((omega^2*u0*ur*e0*er(material))/2)*(-1 ...
    + sqrt(1+(cond(material)/(omega*e0*er(material))))));%Alpha Value
%Beta Values
B = sqrt(((omega^2*u0*ur*e0*er(material))/2)*(1 ...
    + sqrt(1+(cond(material)/(omega*e0*er(material))))));

distance = [.04,0.50,1000];
%Wave Amplitude
E0 = 1;
t = linspace(0,.1,500);%time vector
z = linspace(-distance(material),distance(material),100);
y = linspace(-distance(material),distance(material),100);
[X,Y] = meshgrid(y,z);
figure();
for i = 1: length(t)
    E = E0*cos(omega*t(i) - B*sqrt((X.^2) + (Y.^2)))...
        .*exp(-A*sqrt((X.^2) + (Y.^2)));
    surf(X,Y,E);
    zlabel('Amplitude (V/m)');
    ylabel('y Distance (m)');
    xlabel('z Distance (m)');
    alpha(0.8);% <-- Transparency factor (0 = completely transparent)
    shading interp;% <-- Interpolate between meshes
    camlight left;% <-- Use camera lighting from the left
    lighting phong;% <-- Use lighting scheme 'phong'
    getframe();
end

if material == 1
    title('Wave Propagation in Calcium');
elseif material == 2
    title('Wave Propagation in Mercury');
else
    title('Wave Propagation in Air');
end