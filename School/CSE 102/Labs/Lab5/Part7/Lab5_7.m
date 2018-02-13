clc; clear; close all;
%Part 7
moon = imread('blurrymoon.tif');
figure(1); imshow(moon); title('Original');xlabel('x');ylabel('y');
laplace = fspecial('laplacian',0);
m1 = imfilter(moon,laplace,'replicate');
figure(2); imshow(m1);('Laplacian Filter');xlabel('x');ylabel('y');

moon2 = im2double(moon);
m2 = imfilter(moon2, laplace,'replicate');
figure(3); imshow(m2);title('Temp Conversion'); xlabel('x');ylabel('y');
m3 = imsubtract(moon2,m2);
figure(4); imshow(m3); title('Sharpened Image');xlabel('x');ylabel('y');





