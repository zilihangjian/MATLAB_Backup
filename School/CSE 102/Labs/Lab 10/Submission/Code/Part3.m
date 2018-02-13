clc; clear; close all;
lenna = imread('lenna_RGB.tif');
redC = lenna(:,:,1);
greenC = lenna(:,:,2);
blueC = lenna(:,:,3);

figure(2);
subplot(1,3,1);
imshow(redC);
subplot(1,3,2);
imshow(greenC);
subplot(1,3,3);
imshow(blueC);

smooth_filter = fspecial('average',10);
red_filtered = imfilter(redC,smooth_filter);
blue_filtered = imfilter(blueC,smooth_filter);
green_filtered = imfilter(greenC,smooth_filter);

figure(3);
subplot(1,3,1);
imshow(red_filtered);
subplot(1,3,2);
imshow(blue_filtered);
subplot(1,3,3);
imshow(green_filtered);

color_filtered = cat(3,red_filtered,green_filtered,blue_filtered);
figure(1); subplot(1,2,1); imshow(lenna);
subplot(1,2,2); imshow(color_filtered);