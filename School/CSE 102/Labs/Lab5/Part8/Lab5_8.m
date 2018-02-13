clc; clear; close all;
%Part 8 
moon = imread('blurrymoon.tif');

LEN = 13;
THETA = 8;
figure(1); imshow(moon);title('Original');xlabel('x');ylabel('y');
blur = fspecial('motion',LEN,THETA);
blurMoon = imfilter(moon,blur);
figure(2); imshow(blurMoon);title('Blurred');xlabel('x');ylabel('y');
deblurMoon = deconvwnr(blurMoon,blur);
figure(3); imshow(deblurMoon);title('Deblurred');xlabel('x');ylabel('y');
