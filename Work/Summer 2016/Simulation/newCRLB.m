function [] = newCRLB(LS_estimate, x, y, testPoint)
covMatrix = [var(x), cov(x,y);cov(y,x),var(y)];
syms R t
jacobMatrix = [cos(t), -R*sin(t); sin(t), R*cos(t)];

%Convert the two Coordinates
LS_cart = coordinateTranslation(LS_estimate);
test_cart = coordinateTranslation(testPoint);
%Treat test Point as the center of ellipse
estimateTranslation = [LS_cart(1) - test_cart(1), LS_cart - test_cart(2)];

keyboard
end


function [translatedVector] = coordinateTranslation(vectorLocation)
% function [] = coordinateTranslation()
positionX = R .* cos(vectorLocation(2).*(pi/180)) .* cos(vectorLocation(1).*(pi/180));
positionY = R .* cos(vectorLocation(2).*(pi/180)) .* sin(vectorLocation(1).*(pi/180));
translatedVector = [positionX,positionY];
end