function [p] = LS_2D_Efficient(long,lat,theta, distance)
% function [p, programLength] = LS_2D(longitude,latitude,...
%     theta, testPoint, LOB_length, Type)
%Uses the least squares algorithm to try and find the transmitter location
%based off the input data longitude and latitude.
%Unweighted LS_2D algorithm

%Variable Declaration
elements = length(long);
combVector = cell(1,elements);
R = 0;
q = 0;
p = ones(2,elements);
longEnd = long(:) + distance*cosd(theta(:));%End Point in Longitude
latEnd = lat(:) + distance.*sind(theta(:));%End Point in Latitude

for j = 1: elements
    %Creates the direction vector in the direction of the line and
    %normalizes it
    directionVector = ([longEnd(j) - long(j); latEnd(j) - lat(j)])...
        /norm([longEnd(j) - long(j); latEnd(j) - lat(j)]);
    %Multiplication of the transpose and original
    combVector{j} = directionVector * transpose(directionVector);
    
    %LS Algorithm / Cost Function Evaluation
    R = R + eye(length(combVector{j})) - combVector{j};
    q = q + (eye(length(combVector{j})) - combVector{j})*[long(j), lat(j)]';
    Rinv = pinv(R);
    z = Rinv * q;
    p(1,j) = z(1); 
    p(2,j) = z(2);
end
end