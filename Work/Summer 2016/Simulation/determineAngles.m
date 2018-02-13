function [testTheta, testAzimuth, distanceMax] = determineAngles...
    (test_x, test_y, testPoint)
% function [testTheta, testAzimuth, distanceMax] = determineAngles...
%     (test_x, test_y, testPoint)
%Function used for determining the theta and azimuth angles between a
%receiver coordinate and a transmitter location. It creates a vector in the
%coordinate plane and compares that vector with a standard vector equal to
%the x axis to determine the theta value and the subsequent azimuth value
%Inputs:  test_x, vector containing the x positions of the data
%         test_y, vector containing the y positions of the data
%         testPoint, test transmitter Location
%Outputs: testTheta, vector containing all the theta values in degrees of
%         the test bearings
%         testAzimuth, same as the testTheta vector, but the angle relative
%         to the y axis in the Cartesian plane

%Variable Declarations
coordinateVector = [0 0] + [.05 0];%
%Used for comparing vectors to determine what quadrant in the Cartesian
%system the receiver position is relative to the transmitter
testTheta = ones(1, length(test_x));%Holds the new values for theta in radians
testAzimuth = ones(1, length(testTheta));
delta_x = abs(test_x(:) - testPoint(1));%Difference in x for distance formula
delta_y = abs(test_y(:) - testPoint(2));%Difference in y for distance formula
distance = sqrt(delta_x(:).^2 + delta_y(:).^2);
distanceMax = max(distance);
theta1 = acos(delta_x(:) ./ distance(:));
theta2 = asin(delta_y(:) ./ distance(:));
thetaDifference = theta1(:) - theta2(:);

if thetaDifference(:) < .0000001%Checks to ensure same theta to certain threshold
    for j = 1: length(test_x)
        currentVector = testPoint - [test_x(j) test_y(j)];
        %Generates a vector from the transmitter location to the current
        %receiver position
        
        %Expression to extract the angle from two vectors 
        %More information (moderately interesting math) found at:
        %https://www.mathworks.com/matlabcentral/newsreader/view_thread/151925
        comparisonAngle = mod(atan2(det([coordinateVector; currentVector]),...
            dot(coordinateVector,currentVector)), 2*pi);
        %Computes the angle between the coordinateVector and currentVector
        %to determine relative quadrant location
        
        %First quadrant
        if comparisonAngle > 0 && comparisonAngle <= pi/2
            testTheta(j) = theta1(j);
            
            %Second quadrant
        elseif comparisonAngle > pi/2 && comparisonAngle <= pi
            testTheta(j) = pi - theta1(j);
            
            %Third quadrant
        elseif comparisonAngle > pi && comparisonAngle <= 3*pi/2
            testTheta(j) = pi + theta1(j);
            
            %Fourth quadrant
        elseif comparisonAngle > 3*pi/2 && comparisonAngle <= 2*pi
            testTheta(j) = -theta1(j);
        end
    end
end

testTheta(:) = testTheta(:).*(180/pi);%Converts to Degrees
while min(testTheta) < 0
    testTheta(:) = testTheta(:) + 360;
end
%Convert to Azimuth Angle
%Ensures the angles are all in the same phase from 0 to 2pi
testAzimuth(:) = 90 - testTheta(:);
    if min(testAzimuth) < 0%Tests for less than zero 
        while (min(testAzimuth) < 0)
            [~,minIndex] = min(testAzimuth);
            testAzimuth(minIndex) = testAzimuth(minIndex) + 360;
        end
    elseif max(testAzimuth) > 360%Tests for greater than 360
        while (min(testAzimuth) > 360)
            [~,minIndex] = min(testAzimuth);
            testAzimuth(minIndex) = testAzimuth(minIndex) - 360;
        end
    end
end