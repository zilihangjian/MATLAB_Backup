%Part 5
clc; clear; close all;
moon = imread('blurrymoon.tif');
moon = im2double(moon);
figure(); imshow(moon); title('Original');
lapf = [0 1 0; 1 -4 1; 0 1 0];
m2 = imfilter(moon, lapf,'replicate');
figure(); imshow(m2); title('Temp');
m3 = imsubtract(moon,m2);
figure(); imshow(m3); title('Laplace Filtered');

%b
dipXE = imread('DIPXE.tif');
figure(); imshow(dipXE); title('Original');
A = 4.7;
hbf = A.*[0 0 0; 0 1 0; 0 0 0] + [0 -1 0; -1 4 -1; 0 -1 0];
dipFilter = imfilter(dipXE,hbf);
figure(); imshow(dipFilter);title('High Boost Filtered');
