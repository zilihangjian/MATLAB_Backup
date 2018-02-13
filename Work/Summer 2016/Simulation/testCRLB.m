function [] = testCRLB()
xCoor = rand(1,1000);
yCoor = rand(1,1000);
transmitter = [0.50,0.50];
syms x y;
thetaFunc = atan2(x - transmitter(1),(y - transmitter(2))); 
xGradient = diff(thetaFunc,x);
yGradient = diff(thetaFunc,y);

thetaFunc = symfun(thetaFunc, [x,y]);
xGradFunc = symfun(xGradient, [x,y]);
yGradFunc = symfun(yGradient, [x,y]);

jacobMatrix = ones(2,1000);
jacobMatrix(1,:) = xGradFunc(xCoor(:), yCoor(:));
jacobMatrix(2,:) = yGradFunc(yCoor(:), yCoor(:));

azimuthAngles = thetaFunc(xCoor(:), yCoor(:));
azimuthAngles = double(azimuthAngles);
azMean = mean(azimuthAngles);
azVar = (azMean - azimuthAngles(:)).^2;
covMatrix = diag(azVar);

fishMatrix = jacobMatrix * inv(covMatrix) * jacobMatrix';
P = .50;

A = inv(fishMatrix) ./ (2*log((1-P)^-1));
C = transmitter ./(2*log((1-P)^-1));
figure()
hold on
Ellipse_plot(A,C);
plot(xCoor(:), yCoor(:), '.b');
end