clc; clear; close all;
flower1 = imread('flower1.tif');
figure(1); subplot(1,5,1); imshow(flower1);
red = flower1(:,:,1);
green = flower1(:,:,2);
blue = flower1(:,:,3);
a = zeros(size(flower1,1), size(flower1,2));
redFlower = cat(3,red,a,a);
subplot(1,5,2); imshow(redFlower);

greenFlower = cat(3,a,green,a);
subplot(1,5,3); imshow(greenFlower);

blueFlower = cat(3,a,a,blue);
subplot(1,5,4); imshow(blueFlower);

concateFlower = cat(3,red,green,blue);
subplot(1,5,5); imshow(concateFlower);