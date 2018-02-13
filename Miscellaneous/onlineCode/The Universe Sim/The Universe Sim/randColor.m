%creates a random viable color for planets to use



function [color] = randColor
color = [randi([150,255]),randi([150,255]),randi([150,255])];
color = color/255;
end