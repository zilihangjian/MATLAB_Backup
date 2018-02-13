function [] = loseless_TEM()
% function [] = loseless_TEM()
clc; close all;

%Material Properties
ur = 1;%Assuming non magnetic properties of the materials
u0 = pi*4e-7; %Permability Constant | https://en.wikipedia.org/wiki/Permeability_(electromagnetism)
e0 = 8.854e-12; %Vacuum Constant | https://en.wikipedia.org/wiki/Vacuum_permittivity
er = [1.7, 13.4, 24.3];% Jet Fuel (Jp4) (70° F) 1.7 | Graphite 12-15 | Ethanol (77° F) 24.3

%Wave Properties
freq = [1e3,1e2];%Wave Frequency
omega = 2*pi*freq;%Angular Frequency
vProp = 1./(sqrt(e0*u0*ur.*er));%Velocity of propagation for materials

B(1,:) = omega(1) ./ vProp; %Spatial Frequency 1
t = linspace(0,.1, 2*max(freq));%Time Vector | endTime = .01

%Frequency 1
z(1,:) = linspace(0,vProp(1)*(t(end) + t(end)),2*max(freq));%Spatial Vector
z(2,:) = linspace(0,vProp(2)*(t(end) + t(end)),2*max(freq));%Spatial Vector
z(3,:) = linspace(0,vProp(3)*(t(end) + t(end)),2*max(freq));%Spatial Vector
%Ample Sampling For Signal Processing to avoid Aliasing 

waveFunction1 = cos(omega(1)*t - B(1,1).*z(1,:));
waveFunction2 = cos(omega(1)*t - B(1,2).*z(2,:));
waveFunction3 = cos(omega(1)*t - B(1,3).*z(3,:));

figure();
xlabel('z (meters)');
ylabel('Wave Amplitude');
title('Wave Propagation Dielectric Comparison');
hold on; grid on;
axis([0,max(max(z)),-1,1]);
for j = 1: length(z)
    plot(z(1,j), waveFunction1(j), 'bo',...
    z(2,j),waveFunction2(j), 'g^',... 
    z(3,j),waveFunction3(j), 'rs'); 
    set(gca, 'nextplot', 'replacechildren');
    pause(.01);
    if z(1,j) >= vProp(1)*t(end) && z(2,j) >= vProp(2)*t(end) && z(3,j) >= vProp(3)*t(end)
        break
    end
end
legend('Dielectric1: Jet Fuel(1.7)', 'Dielectric2: Graphite (13.4)',...
    'Dielectric3: Ethanol(24.3)'); 

%Frequency 2
B(2,:) = omega(2) ./ vProp; %Spatial Frequency 2
z(4,:) = linspace(0,vProp(1)*(t(end) + t(end)),2*max(freq));%Spatial Vector
z(5,:) = linspace(0,vProp(2)*(t(end) + t(end)),2*max(freq));%Spatial Vector
z(6,:) = linspace(0,vProp(3)*(t(end) + t(end)),2*max(freq));%Spatial Vector

waveFunction4 = cos(omega(2)*t - B(2,1).*z(1,:));
waveFunction5 = cos(omega(2)*t - B(2,2).*z(2,:));
waveFunction6 = cos(omega(2)*t - B(2,3).*z(3,:));

figure();
xlabel('z (meters)');
ylabel('Wave Amplitude');
title('Wave Propagation Dielectric Comparison');
hold on; grid on;
axis([0,max(max(z)),-1,1]);
for j = 1: length(z)
    plot(z(4,j), waveFunction4(j), 'bo',...
    z(5,j),waveFunction5(j), 'g^',... 
    z(6,j),waveFunction6(j), 'rs'); 
    set(gca, 'nextplot', 'replacechildren');
    pause(.01);
    if z(4,j) >= vProp(1)*t(end) && z(5,j) >= vProp(2)*t(end) && z(6,j) >= vProp(3)*t(end)
        break;
    end
end
legend('Dielectric1: Jet Fuel(1.7)', 'Dielectric2: Graphite (13.4)',...
    'Dielectric3: Ethanol(24.3)'); 
end