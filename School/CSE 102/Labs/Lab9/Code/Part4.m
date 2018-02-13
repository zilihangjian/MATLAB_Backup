clc; close all; clear;
f = imread('building_original.tif');
w45 = [-2 -1 0; -1 0 1; 0 1 2];
g45 = imfilter(double(f), w45, 'replicate');
T = 0.3*max(abs(g45(:)));
g45 = g45 >= T;
figure, imshow(g45); title('Plus 45');

q45 = [0 1 2; -1 0 1; -2 -1 0];
g245 = imfilter(double(f), q45, 'replicate');
T = 0.3*max(abs(g245(:)));
g245 = g245 >= T;
figure, imshow(g245); title('Minus 45');

diagonal = max(abs(g45), abs(g245));
figure, imshow(diagonal); title('Diagonal Image');