%Compute Vertical Edges
clc; close all; clear;
building = imread('building_original.tif');
figure(1); imshow(building); title('Original');
hsobel = fspecial('sobel');
hprewitt = fspecial('prewitt');

hsobel = hsobel';
hprewitt = hprewitt';

building_sobel = imfilter(building,hsobel);
figure(2); imshow(building_sobel);title('Vertical Sobel');
building_prewitt = imfilter(building,hprewitt);
figure(3); imshow(building_prewitt);title('Vertical Prewitt');