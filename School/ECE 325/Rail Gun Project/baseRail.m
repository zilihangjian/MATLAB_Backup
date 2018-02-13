function [] = baseRail()
% function [] = baseRail(d, r, I)
%Inputs: d: distance between wires(this model uses semiInfinite
%        r: crossSectional radius of the rails(Assumed to be circular)
clc; close all
u0 = (4*pi)*10^-7; %Permeability of Free Space Coefficient
format long;
%Anonymous equation depending on the distance between the two rails, the
%radius of the cylindrical rails, and the current produced by the source
railForce = @(d,r,I)((u0*I.^2)*log((d-r)/r)/(2*pi));

% railForce2 = @(

r1 = 0.02; %meters
I1 = 5; %Amps
d1 = 0.05; %meters
%--------------------------------------------------------------------------
%Varying current while keeping d and r constant
%--------------------------------------------------------------------------
I = linspace(0,15,10000);
force1_current = railForce(d1,r1,I);
figure();
plot(I,force1_current,'r');
title('Force vs Current');
xlabel('Current: Amps');
ylabel('Force: Newton-meters');

%--------------------------------------------------------------------------
%Varying radius of rails while keeping d and I constant
%--------------------------------------------------------------------------
r = linspace(0.01,.05,10000);
force1_radius = ones(1,length(r));
for j = 1: length(r)
    force1_radius(j) = railForce(d1,r(j),I1);  
end
figure();
hold on;
plot(r, real(force1_radius),'r');
title('Radius of Rails vs Force');
xlabel('Radius: meters');
ylabel('Force: Newton-meters');

%--------------------------------------------------------------------------
%Varying distance apart while keeping r and I constant
%--------------------------------------------------------------------------
d = linspace(0.01,.02,10000);
force1_distance = railForce(d,r1,I1);
figure();
hold on;
plot(d, real(force1_distance),'r');
title('Distance vs Force');
xlabel('Distance: meters');
ylabel('Force: Newton-meters');

%--------------------------------------------------------------------------
%Determing velocity relationships with the current
%--------------------------------------------------------------------------
m = .001; %kg
F1 = railForce(d1,r1,0.50);
F2 = railForce(d1,r1,1.50);
F3 = railForce(d1,r1,2);
F4 = railForce(d1,r1,5);
F5 = railForce(d1,r1,15);
accelVector = [F1/m, F2/m, F3/m, F4/m, F5/m];
figure();
hold on;
for j = 1: length(accelVector)
    plot(accelVector(j)*linspace(0,3,3));
end
titleString = strcat('Velocity Functions | m = ', num2str(m), ' kg');
title(titleString);
xlabel('Time');
ylabel('Velocity');
legend('I = .50', 'I = 1.50', 'I = 2', 'I = 5', 'I = 15') 




end