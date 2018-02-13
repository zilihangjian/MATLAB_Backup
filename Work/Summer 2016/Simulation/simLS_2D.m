function [LS_estimate] = simLS_2D(noisyLong, noisyLat)

%Variable Declaration
tic;
elements = length(noisyLong);
R = 0; q = 0;
xIni = noisyLong(1,:); xFin = noisyLong(2,:);
yIni = noisyLat(1,:); yFin = noisyLat(2,:);

for j = 1: elements
    directionVector = ([xFin(j) - xIni(j); yFin(j) - yIni(j)])...
        /norm([xFin(j) - xIni(j); yFin(j) - yIni(j)]);
    %Creates the direction vector in the direction of the line and
    %normalizes it
    
    transposeVector = transpose(directionVector);%Transpose of the current vector
    combinedVector = directionVector * transposeVector;
    
    %LS Algorithim for Cost Function Evaluation
    R = R + (eye(length(combinedVector)) - combinedVector);
    q = q + ((eye(length(combinedVector)) - combinedVector)) * ...
        [noisyLong(1,j),noisyLat(1,j)]';
end
Rinv = pinv(R);
LS_estimate = Rinv * q;
toc
end