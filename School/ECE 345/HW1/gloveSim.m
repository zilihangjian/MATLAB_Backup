function [prob, simTime] = gloveSim(numSim)
%function [prob, simTime] = gloveSim(numSim)
%Inputs: numSim, integer value for the number of simulations
%OutputsL prob, floating point for the probability value of the simulation
%         simTime, floating point for the simulation length
%# of Simulations
tic;
rng('shuffle');
box1 = [0, 0, 0, 0, 0, 1, 1, 1, 1];%Picked 1 in first Pick
box2 = [0, 0, 0, 0, 1, 1, 1, 1, 1];%Picked 0 in first Pic
pick1 = round(rand(1,numSim));%Generates a (1,numSim) vector containing zeros and ones
pick2 = randi(9,numSim,1);%Generates a (1, numSim) vector from 1 to 9
correctSolution = 0;%Keeps track of optimum solutions

%Vectorization Attempt
% if pick1(:) == 1
%     if (box1(pick2(:)) + 1) == 1
%         correctSolution = correctSolution + 1;
%     end
% elseif pick1(:) == 0
%     if (box2(pick2(:)) + 0) == 1
%         correctSolution = correctSolution + 1;
%     end
% end

%Iterations
for j = 1: numSim
    if pick1(j) == 1
        if (box1(pick2(j))) == 0%Checks for 0, 
            correctSolution = correctSolution + 1;
        end
    elseif pick1(j) == 0
        if (box2(pick2(j))) == 1%Checks for 1,
            correctSolution = correctSolution + 1;
        end
    end
end
prob = correctSolution / numSim;
simTime = toc;
end