function [maxRange] = binaryRange(v0,B,m,deltat,g)
%BINARYRANGE Summary of this function goes here
%   Detailed explanation goes here
maxRange(1) = 0;
maxTheta(1) = 45;
count = 1;
difference = 1;
while difference >= 1e-4
    maxTheta(count+1) = maxTheta(count) + (maxTheta(count)/2);
    

end
end

