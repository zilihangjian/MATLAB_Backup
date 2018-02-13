function [p, programLength] = LS_2D(longitude,latitude,...
    theta, testPoint, LOB_length, Type)
% function [p, programLength] = LS_2D(longitude,latitude,...
%     theta, testPoint, LOB_length, Type)
%Uses the least squares algorithm to try and find the transmitter location
%based off the input data longitude and latitude. 
tic;
if nargin < 6 
    Type = [];
end
%Variable Declaration
elements = length(longitude);
R = 0; q = 0;
combinedVector = cell(1,elements);
coefficientStrength = ones(1,elements);
if ~isempty(Type)
    % Adds coefficient strength to the data considered high precision. This
    % weighting will put more emphasis on that data and weight the transmitter
    % position accordingly
    for j = 1: elements
        if isequal('HP', Type{j})
            coefficientStrength(j) = 3;
        end
    end
end

%Graphics
title('Least Squares Estimation of Transmitter Location');
xlabel('Longitude'); ylabel('Latitude');
hold on; axis tight;

for j = 1: elements
    xIni = longitude(j);%Initial x Coordinate
    yIni = latitude(j);%Initial y Coordinate
    [xNew, yNew] = createLine([xIni yIni], LOB_length, theta(j));
    %Generates the end coordinates of the line
    directionVector = ([xNew - xIni; yNew - yIni])...
        /norm([xNew - xIni; yNew - yIni]);
  
    %Creates the direction vector in the direction of the line and
    %normalizes it
    pause(.001);
    drawnow;
    p1 = plot([xIni xNew],[yIni yNew],'g');
    %Multiplication of the transpose and original
    combinedVector{j} = directionVector * transpose(directionVector);
end

for j = 1: elements
    %LS Algorithm / Cost Function Evaluation
    R = R + coefficientStrength(j) .* (eye(length(combinedVector{j})) ...
        - combinedVector{j});
    q = q + coefficientStrength(j) .* ((eye(length(combinedVector{j})) ...
        - combinedVector{j}))*[longitude(j), latitude(j)]';
    Rinv = pinv(R);
    p = Rinv * q;
    if j > 5
        pause(.001);
        drawnow;
        p2 = plot(p(1),p(2), 'bo');
    end
    
end

p3 = plot(p(1), p(2), 'ro');
p4 = plot(testPoint(1), testPoint(2), 'vk', 'MarkerSize', 12);
if j > 5
    legend([p1, p2, p3, p4], 'LOB', 'LS Estimates', 'LS Final Estimate',...
        'Transmitter Location','Location', 'northoutside','Orientation', 'horizontal');
else
    legend([p1, p3, p4], 'LOB', 'LS Final Estimate','Transmitter Location',...
        'Location', 'northoutside','Orientation', 'horizontal');
end
programLength = toc;
end

function [xNew, yNew] = createLine(initialCoordinates,line_length, angle)
%function [xNew, yNew] = createLine(initialCoordinates,line_length, angle)

xIni = initialCoordinates(1);%Initial x coordinate
yIni = initialCoordinates(2);%Initial y coordinate
xNew = xIni + (line_length*cosd(angle));%Generates ending x coordinate of line
yNew = yIni + (line_length*sind(angle));%Generates ending y coordinate of line

end