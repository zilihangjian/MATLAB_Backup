%Solves for the mass of a sun based on on the type size and temperature



function [mass] = sunMass(type,radius,t)

%constants(speed of light, gravitational constant, and the mass of our sun)
c = 2.998e8;
G = 6.67408e-11;
S = 1.98855e30;

%formula for the mass of a black hole
if type == 'black'
    mass = ((radius*1000)*(c^2)/(2*G));
end   

%a giant star is around this massive on average
if type == 'giant'
    mass = S*(8+(radius-100000000)*(92/900000000));
end 

%a dwarf star is around this massive on average
if type == 'dwarf'
    %finds the mass based on the different types of dwarf stars
    if t <5000
        mass = S*(.075+(radius-1000)*(1.125/99000));
    else
        mass = S*(.8+(radius-1000)*(.4/99000));
    end
end
  
%finds mass based on density of an average star.
if type == 'norml'
    D = 1410;%density of sun
    mass = ((radius*1000)^3)*4*D*pi/3;
end   
end