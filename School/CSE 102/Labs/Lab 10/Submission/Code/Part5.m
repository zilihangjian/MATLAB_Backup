clc; clear; close all;
lenna = imread('rgb_image_G_saltpep_pt05.tif');
filter = fspecial('average',10);
redC = lenna(:,:,1);
greenC = lenna(:,:,2);
blueC = lenna(:,:,3);

red_filtered = imfilter(redC,filter);
blue_filtered = imfilter(blueC,filter);
green_filtered = imfilter(greenC,filter);

color_filtered = cat(3,red_filtered,green_filtered,blue_filtered);
figure(1); subplot(1,2,1); imshow(lenna);
subplot(1,2,2); imshow(color_filtered);