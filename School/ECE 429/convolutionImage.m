clear;close all
A = imread('Miami.jpg');
A1 = rgb2gray(A);
B1 = [0 1 0; 1 -4 1;0 1 0];
LA_1 = filter2(B1,A1);
figure
subplot(2,1,1)
imshow(A1);
title('Original Image');
subplot(2,1,2)
imshow(uint8(LA_1));