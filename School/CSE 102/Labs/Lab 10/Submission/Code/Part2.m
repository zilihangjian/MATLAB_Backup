clc; clear; close all;
flower = imread('flower.tif');
figure(1); subplot(1,5,1); imshow(flower);
[X1, map1] = rgb2ind(flower,8,'nodither');
subplot(1,5,2); subimage(X1,map1);

[X2, map2] = rgb2ind(flower,8,'dither');
subplot(1,5,3); subimage(X2,map2);

grayScale = rgb2gray(flower);
subplot(1,5,4); imshow(grayScale);
ditherGray = dither(grayScale);
subplot(1,5,5); imshow(ditherGray);
