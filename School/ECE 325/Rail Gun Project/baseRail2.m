function [] = baseRail2(L,W,I, m,v0)
% function [] = baseRail2(L,W,I)
%This function computes force exerted on a railgun slug based on the
%initial input of the Length of the completed circuit, Width of the 
%completed circut, and constant current input. For this case the Length
%will change with time as the slug moves and decreases the Length of the
%completed circuit. Also assumes the current is DC and not changing with
%time
close all
u0 = (4*pi)*10^-7; %Permeability of Free Space Coefficient
railForce = @(L,W,I)...
    (((u0*L*I^2)/pi)*((W^2 + L^2 - L*(sqrt(W^2 + L^2)))/sqrt(W^2+L^2)));

timeStep = .1;%Determines each point for the velocity 
forceValues(1) = railForce(L,W,I);%Initial Force on slug
acceleration(1) = forceValues(1)/m;
displacement(1) = acceleration(1)*(timeStep)^2 + v0*(timeStep)^2;
j = 2;
while L > 1e-10 
    forceValues(j) = railForce(L,W,I);
    acceleration(j) = forceValues(j)/m + acceleration(j-1);
    displacement(j) = acceleration(j)*(timeStep)^2; 
    L = L - displacement(j);
    j = j + 1;
end

figure();
plot(linspace(timeStep,j,j-1), forceValues,'b');
title('Force vs Time');
xlabel('Time');
ylabel('Force');

figure();
plot(linspace(timeStep,j,j-1),displacement ,'b');
title('Force vs Time');
xlabel('Time');
ylabel('Force');

keyboard


end