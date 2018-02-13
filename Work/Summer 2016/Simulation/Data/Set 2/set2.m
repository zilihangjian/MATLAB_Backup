function [] = set2(start, duration, figureCheck)
%First Circle: start = 1 | duration = 80
%Repeat First Circle: start = 81 | duration = 153
%First Line: start = 154 | duration = 210
%Second Circle: start = 211 | duration = 282
%Second Line: start = 283 | duration = 337
%Third Circle: start = 338 | duration = 408 
%Repetition Point:
%Third Circle Squiggle: start = 409 | duration = 432 
%Repeat Third Circle: start = 433 | duration = 498
%Repeat Second Line: start = 499 | duration = 543
%Repeat Second Circle: start = 544 | duration = 617
%Repeat First Line: start = 618 | duration  = 667
%Third Repeat of First Circle: start = 668 | duration = 746
%Partial Fourth Repeat of First Circle: start = 747 | duration = 772
clc; load('set2data.mat'); 
if nargin < 1
    duration = dataPoints;
    start = 1;
    figureCheck = 1;
end

if figureCheck
    figure();
end
hold on; title('Data Set 2');
%Plots Line of Bearings
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
%Plots Receiver Points
for j = start: duration
    plot(PlatLon(j), PlatLat(j), '.b', 'MarkerSize', 10);
end
axis([-111.40, -111.33, 33.055, 33.105]);
xlabel('Longitude'); ylabel('Latitude');