function [slopeVector, slopeTime] = slopeDetermination(vector, time, step)
% function [slopeVector] = averageDetermination(vector,time,step)
upperVectInd = find(vector > 100);
upperVect = vector(upperVectInd);
upperTime = time(upperVectInd);
figure()
plot(upperTime, upperVect);
grad2Vect = gradient(upperVect,step);
filtGrad2Vect = movingAverage(grad2Vect, 11);
figure()
plot(upperTime, grad2Vect, upperTime, filtGrad2Vect);
title('Second Order Gradient')
mainInd = find(filtGrad2Vect > -200 & filtGrad2Vect < 200);
slopeVector = upperVect(mainInd);
slopeTime = upperTime(mainInd);
figure()
plot(slopeTime, slopeVector);
title('Slope Extraction')
end