function [] = steepestDescent(longitude, latitude, initialE)
%function [] = steepestDescent(longitude, latitude, initialE)
%Not Currently Working
%Variable Declaration
currentEstimate = initialE;
dataPoints = length(longitude);
gamma = linspace(0,1000,1000);
syms X Y;
func = atan2(Y,X);
gradient_2D = gradient(func);
convergeCheck = true;%Temporary setting for the convergent check
minGamma = 1000000000;
iterations = 0;
while convergeCheck
    g0 = double(subs(gradient_2D, {Y,X},{(currentEstimate(2) - ...
        latitude(1)), (currentEstimate(1) - longitude(1))}));
    d0 = -g0;%Direction
    if d0(1) == 0 && d0(2) == 0
        break
    end
    for j = 1:length(gamma)
        testGamma = double(subs(func, {X,Y},...
            {(currentEstimate(2) - latitude(1) + gamma(j).*d0(1)), ...
            (currentEstimate(1) - longitude(1) + gamma(j).*d0(2))}));
        if testGamma < minGamma
            minGamma = gamma(j);
            minValue = testGamma;
        end
    end
    
newEstimate = currentEstimate + (minGamma .* (d0)');
currentEstimate = newEstimate;
disp(newEstimate);
iterations = iterations + 1;
end
end