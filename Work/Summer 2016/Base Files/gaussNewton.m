function [] = gaussNewton(noisyLong, noisyLat, testPoint)
%Function used for approximating the transmitter location through receiver
%position data by using the Gauss Newton Algorithm

%Variable Declaration
tolerance = 1e-8;
stepSize = 100;

%Initial Guess to the location of the origin point
transmitterGuess = ones(2,stepSize);
transmitterGuess(1,1) = testPoint(1) + .10; 
transmitterGuess(2,1) = testPoint(2) + .10;
dataPoints = length(noisyLong);%number of receiver positions
dimensions = min(size(transmitterGuess));%relative to coordinate plane
jacob = ones(dataPoints,dimensions);
minFunction = ones(1,dataPoints);

%Iterations
for k = 1:stepSize
    differenceSum = 0;
    [distances, guessDistances] = determineDistances(noisyLong, ...
        noisyLat, transmitterGuess);
    
    for i = 1:dataPoints
        
        for j = 1:dimensions
            jacob(i,j) = calculateJacobian(noisyLong(1,i),noisyLat(1,i), ...
                transmitterGuess(1,k), transmitterGuess(2,k), j);
        end
        
        minFunction(i) = distances(i) - guessDistances(i);
        differenceSum = differenceSum + minFunction(i)^2;
    end
    keyboard
    jacobCombination = transpose(jacob)*jacob;
    g = jacobCombination\transpose(jacob);
 
    currentGuess = [transmitterGuess(1,k);transmitterGuess(2,k)]...
        + (g * -minFunction');
    transmitterGuess(1,k+1) = currentGuess(1);
    transmitterGuess(2,k+1) = currentGuess(2);
    errorX = transmitterGuess(1,k+1) - transmitterGuess(1,k);
    errorY = transmitterGuess(2,k+1) - transmitterGuess(2,k);
    
    %Convergence Check
    if(abs(errorX) <= tolerance && abs(errorY) <= tolerance);
        break
    end
end
%Graphics
figure(); hold on; axis tight;
title('Gauss Newton'); xlabel('x'); ylabel('y');
for j = 1:length(transmitterGuess)
    plot(transmitterGuess(1,j), transmitterGuess(2,j),'bo')
    pause(.05);
    drawnow;
end
plot(testPoint(1), testPoint(2), 'rx');
keyboard
end

%--------------------------------------------------------------------------
%Sub Functions
%--------------------------------------------------------------------------

function value = calculateJacobian(p,q,a1,a2,index)
switch index
    case 1
        value = (2*a1 - 2*p) * .5 * ((a1-p)^2 + (a2 - 1)^2)^-.5;
    case 2
        value = (2*a2 - 2*q) * .5 * ((a1-p)^2 + (a2 - 1)^2)^-.5;
end
end

function [distances, guessDistances] = determineDistances(noisyLong, ...
    noisyLat, transmitterGuess)
distances = ones(1, length(noisyLong));
guessDistances = ones(1, length(noisyLong));
for i = 1: length(noisyLong)
    distances(i) = sqrt((noisyLong(1,i) - noisyLong(2,i))^2 ...
        + (noisyLat(1,i) - noisyLat(2,i))^2);
    guessDistances(i) = sqrt((noisyLong(1,i) - transmitterGuess(1))^2 ...
        + (noisyLat(1,i) - transmitterGuess(2))^2);
end
end