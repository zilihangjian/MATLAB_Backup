function [] = set1(start, duration, figureCheck)
%First Circle: start = 1 | duration = 57
%First Line: start = 58 | duration = 116
%Second Circle: start = 117 | duration = 191
%Second Line: start = 192 | duration = 268
%Third Circle: start = 269 | duration = 342
%Third Circle Squiggle: start = 343 | duration = 370
%Repetition Point
%Repeat Third Circle: start = 371 | duration = 421
%Repeat Second line: start = 422 | duration = 481
%Repeat Second Circle: start = 482 | duration = 558
%Repeat First Line: start = 559 | duration = 596
%Repeat First Circle: start = 597 | duration = 681
clc; load('set1data.mat');
if nargin < 1
    duration = dataPoints;
    start = 1;
    figureCheck = 1;
end
if figureCheck
    figure();
end

hold on; title('Data Set 1');
for j=start: duration
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
for j=start: duration
    plot(PlatLon(j), PlatLat(j), '.b', 'MarkerSize', 10);
end
axis([-111.40, -111.33, 33.055, 33.105]); 
xlabel('Longitude'), ylabel('Latitude');
end