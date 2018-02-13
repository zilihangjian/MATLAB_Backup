function [] = CRLB(testPoint, azimuth, noisyAzimuth, estimates)
%Function for computing the Cramer Rao Lower Bound for the receiver data to
%try and approximate the error ellipse for the transmitter location

%Variable Declaration

syms x y;
thetaFunc = atan2(x - testPoint(1),(y - testPoint(2))); 
xGradient = diff(thetaFunc,x);
yGradient = diff(thetaFunc,y);

xGradFunc = symfun(xGradient, [x,y]);
yGradFunc = symfun(yGradient, [x,y]);

jacobMatrix = ones(2,length(estimates));
jacobMatrix(1,:) = double(xGradFunc(estimates(:,1), estimates(:,2)));
jacobMatrix(2,:) = double(yGradFunc(estimates(:,1), estimates(:,2)));

covMatrix = (noisyAzimuth - azimuth)'*(noisyAzimuth - azimuth);
P = .90;
keyboard
fishMatrix = jacobMatrix' * inv(covMatrix) * jacobMatrix;
ellipseFunc = @(x,y)(([x,y]' - testPoint') * inv(fishMatrix) * ...
    ([x,y]' - testPoint') - 2*log((1-P)^-1));

fplot(ellipseFunc, [min(estimates(1,:)),max(estimates(1,:))],...
    [min(estimates(2,:)),max(estimates(2,:))]);



















%Covariance Matrix
% noisyAzimuth = noisyAzimuth';
% sigmas = ((noisyAzimuth(:) - mean(noisyAzimuth)).^2)./(numel(noisyAzimuth));
% covMatrix = diag(sigmas); %Covariance Matrix of the Data
% 
% jacobian = ones(dataPoints,2);
% syms X Y;
% func = atan2(Y,X);
% gradient_2D = gradient(func);
% 
% %Jacobian Calculation
% for i = 1: dataPoints
%     gradientNumeric = subs(gradient_2D, {Y,X},{(testPoint(2) - ...
%         y(i)), (testPoint(1) - x(i))});
%     jacobian(i,2) = gradientNumeric(1);
%     jacobian(i,1) = gradientNumeric(2);
% end
% 
% FIM = transpose(jacobian) * (covMatrix \ jacobian); %Fisher Information Matrix
% IFIM = inv(FIM);
% sigmaX = IFIM(1,1);
% sigmaY = IFIM(2,2);
% sigmaXY = IFIM(1,2);
% 
% %Ellipse Variables
% aSquare = (sigmaX + sigmaY)./2 + ...
%     sqrt((((sigmaX - sigmaY).^2)./4) + sigmaXY.^2);
% bSquare = (sigmaX + sigmaY)./2 - ...
%     sqrt((((sigmaX - sigmaY).^2)./4) + sigmaXY.^2);
% tilt = 0.50 * atand(2*sigmaXY/(sigmaX - sigmaY));
% alpha = 2.50;%Impacts percentage based on chi squared values
% a = sqrt(aSquare) * alpha;
% b = sqrt(bSquare) * alpha;
% ellipseGeneration(a,b,tilt,0,0);
end