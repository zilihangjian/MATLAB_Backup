%Compute Horizontal Edges
clc; close all; clear;
building = imread('building_original.tif');
figure(1); imshow(building);title('Original');
hsobel = fspecial('sobel');
hprewitt = fspecial('prewitt');

building_sobel = imfilter(building,hsobel);
figure(2); imshow(building_sobel);title('Horizontal Sobel');
building_prewitt = imfilter(building,hprewitt);
figure(3); imshow(building_prewitt);title('Horizontal Prewitt');
