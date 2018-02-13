function [Ptarget] = EMsetup(Pinput)
% function [] = EM_setup(Pinput)

%Constants
u0 = pi*4e-7;%Permability Constant
e0 = 8.854e-12; %Vacuum Constant
d1 = 0.40;%Layer 1 
d2 = 0.50;%Layer 2

%Frequency 
freq = 750e6;%750 MHz
omega = 2*pi*freq;
radius = .04;

%Conductivity 
cond_Air = 5e-15;
cond_Soil = 170.3333e-3;
cond_Sandstone = 5e-13;
cond_Iron = 1.04e7;
cond = [cond_Air, cond_Soil, cond_Sandstone, cond_Iron];

%Permeability (Relative)
u_Air = 1.00000037;
u_Soil = 1;
u_Sandstone = 0.999985;
u_Iron = 5000;
u = [u_Air, u_Soil, u_Sandstone, u_Iron];

%Permittivity
e_Air = 1.00058986;
e_Soil = 8.325;
e_Sandstone = 4.175;
e_Iron = 1;
e = [e_Air, e_Soil, e_Sandstone, e_Iron];

%Alpha & Beta
gamma = sqrt((1i*omega*u0.*u).*(cond + (1i*omega*e0.*e)));
alpha = real(gamma);
% beta = imag(gamma);

%Eta
eta = sqrt((1i*omega*u0.*u)./(cond + (1i*omega*e0.*e)));
eta(1) = 120*pi;%Assumption for air / vacuum as imaginary part is quite small

%Power of Target Calculations
%First Stage Air(1) to Soil(2)
E0i = sqrt(((2*Pinput*eta(1)) / (pi*radius^2)));
E0t = E0i*((2*eta(1)) / (eta(1) - eta(2)));

%Second Stage Soil(2) to SandStone(3)
E1i = E0t * exp(-(alpha(2)*d1));
E1t = E1i*((2*eta(2)) / (eta(2) - eta(3)));

%Third Stage SandStone(3) to Iron(4)
E2i = E1t * exp(-(alpha(3)*d2));
E2r = E2i*((eta(4) - eta(3)) / (eta(4) + eta(3)));
% E2t = E2i*((2*eta(4)) / (eta(4) - eta(3)));

%Fourth Stage Iron(4) Reflection | SandStone(3) to Soil(2)
E3i = E2r*exp(-(alpha(3)*d2));
E3t = E3i*((2*eta(3)) / (eta(3) - eta(2)));

%Fifth Stage Soil(2) to Air(1)
E4i = E3t*exp(-(alpha(2)*d2));
E4t = E4i*((2*eta(2)) / (eta(2) - eta(1)));%Return pulse to Receiever

%Target Power 
Ptarget = real(((0.5*abs(E4t.^2) / (2 * eta(1))))*(pi*radius^2));

end