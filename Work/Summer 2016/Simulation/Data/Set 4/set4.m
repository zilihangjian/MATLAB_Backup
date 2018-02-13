function [] = set4(start, duration, figureCheck)
%First Circle: start = 1 | duration = 76
%Partial Repeat First Circle: start = 77 | duration = 101
%First Line: start = 102 | duration = 150
%Second Circle: start = 151 | duration = 222
%Second Line: start = 223 | duration = 273
%Third Circle: start = 274 | duration = 343
%Third Circle Squiggle: start = 344 | duration 366
%Repetition Point
%Repeat of Third Circle: start = 367 | duration 420
%Repeat Second Line: start = 421 | duration 479
%Repeat Second Circle: start = 480 | duration 554
%Repeat First Line: start = 555 | duration 602
%Repeat First Circle: start 603 | duration 679
clc; load('set4data.mat');
if nargin < 1
    start = 1;
    duration = dataPoints;
    figureCheck = 1;
end

if figureCheck
    figure();
end
hold on; title('Data Set 4');
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