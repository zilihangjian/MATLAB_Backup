clear all;
% Calculate Zo of a microstrip trace (units = inches) 
% Dimensions (in inches): 
h=2e-3; % Trace height 
w=10e-3; % Trace width 
hg=20e-3; % Height above GND plane 
d=30e-3; % Separation between two traces 
Ltot=20; % Total length parameters 
rho=3e-8*39.37; % For copper, in Ohm*in
e0=8.854e-12*0.0254; % Dielectric constant (in Farads/inch) 
e_air=1; % Relative permittivity of air 
e_FR4=4.5; % Relative permittivity of FR4
rho_FR4=1e12*2.54; % For FR4
l=1; % For per-inch values 
S=l*w; 
R=rho*l/S; 
C=2*e0*e_air*S/hg; % Doubled (fringe fields) 
G=1/(rho_FR4*hg/S); 
L=0.00508*l*(log(2*l/(w+h))+.5+0.2235*(w+h)/l)*1e-6; % From ARRL handbook
f=linspace(100e6,10e9,1e5); % Frequency: From DC to 10 GHz 
Zo=sqrt((R+1i*2*pi*f*L)./(G+1i*2*pi*f*C));
subplot(2,1,1); plot(f, real(Zo));
grid;
xlabel('Frequency, Hz');
ylabel('Real part of Zo'); 
subplot(2,1,2); plot(f, imag(Zo));
grid;
xlabel('Frequency, Hz');
ylabel('Imaginary part of Zo');