function [] = set3(start, duration, figureCheck)
%First Circle: start = 1 | duration = 77
%Partial Repeat of First Circle: start = 78 | duration = 115
%First Line: start = 116 | duration = 179
%Second Circle: start = 180 | duration = 250
%Second Line: start = 251 | duration = 305
%Third Circle: start = 306 | duration = 378
%Third Circle Squiggle: start = 379 | duration = 404
%Repetition Point
%Repeat Third Circle: start = 405 | duration = 475
%Repeat Second Line: start = 476 | duration = 528
%Repeat Second Circle: start = 529 | duration = 602
%Repeat First Line: start = 603 | duration = 653
%Repeat of First Circle: start = 654 | duration = 736
clc; load('set3data.mat'); 
if nargin < 1
    duration = dataPoints;
    start = 1;
    figureCheck = 1;
end

if figureCheck
    figure();
end
hold on; title('Data Set 3');
for j = start: duration
    startPoint = [PlatLon(j) PlatLat(j)];
    leng = 0.02;
    x2 = startPoint(1) + (leng*cosd(theta(j)));
    y2 = startPoint(2) + (leng*sind(theta(j)));
    endPoint = [x2 y2];
    x = [startPoint(1) endPoint(1)];
    y = [startPoint(2) endPoint(2)];
    plot(x', y','r');
end
plot(transmitterLocation(1),transmitterLocation(2), '-vk','MarkerSize',10);
for j = start: duration
    plot(PlatLon(j), PlatLat(j), '.b', 'MarkerSize', 10);
end
axis([-111.40, -111.33, 33.055, 33.105]);
xlabel('Longitude'); ylabel('Latitude');
end