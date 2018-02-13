function [prob, simTime] = dieSim(rollNum, numCheck, simNum)
% function [prob, simTime] = dieSim(rollNum, numCheck, simNum)
tic; 
correctSolution = 0;
for i = 1: simNum
    die = randi(6,rollNum,1)';%rolling a dice n times simulation
    for j = 1: length(die)
        if die(j) == numCheck
            correctSolution = correctSolution + 1;
            break
        end
    end
end
prob = correctSolution / simNum;
simTime = toc;
end

