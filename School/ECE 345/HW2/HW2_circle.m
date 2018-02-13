function [prob, simTime] = HW2_circle(numSim)
% function [prob, simTime] = HW2_circle(numSim)
% For HW2, the input should be 1000000, and the value for prob will be the
% result
tic;
rng('shuffle');
randX = rand(1,numSim);%Vector containing the x coordinates from [0 1]
randY = rand(1,numSim);%Vector containing the y coordinates form [0 1]

%Calculates the distance from the center to the randomly generated points
distanceCenter = sqrt((0.50 - randX(:)).^2 + (0.50 - randY(:)).^2);
optimalValues = 0;
for j = 1: numSim
    if distanceCenter(j) <= .50
        optimalValues = optimalValues + 1;
    end
end
prob = optimalValues / numSim;
simTime = toc;
end