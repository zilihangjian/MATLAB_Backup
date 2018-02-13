function [LS_estimate] = LS_3D(x1,y1,z1,x2,y2,z2)
% function [LS_estimate] = LS_3D(x1,y1,z1,x2,y2,z2)
%Uses the least squares algorithm to try and find the transmitter location
%based off the input data longitude and latitude. 3 Space Approximation

%Variable Declaration
elements = length(x1);
R = 0; q = 0;

for j = 1: elements
    %Creates the direction vector in the direction of the line and
    %normalizes it
    directionVector = ([x1(j) - x2(j); y1(j) - y2(j); z1(j) - z2(j)])...
        /norm([x1(j) - x2(j); y1(j) - y2(j); z1(j) - z2(j)]);
    transposeVector = transpose(directionVector);%Transpose of the current vector
    combinedVector = directionVector * transposeVector;
    
    %LS Algorithim for Cost Function Evaluation
    R = R + (eye(length(combinedVector)) - combinedVector);
    q = q + ((eye(length(combinedVector)) - combinedVector)) * ...
        [x1(j),y1(j),z1(j)]';
    %     if j > 5
    %         Rinv = pinv(R);
    %         LS_estimate = Rinv * q;
    %         drawnow
    %         pause(.005);
    %         plot3(LS_estimate(1), LS_estimate(2), LS_estimate(3), 'bo');
    %     end
end
Rinv = pinv(R);
LS_estimate = Rinv * q;
% plot3(LS_estimate(1), LS_estimate(2), LS_estimate(3), 'ro');
end