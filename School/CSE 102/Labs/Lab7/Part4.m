clc; clear; close all;
miami = imread('Miami.jpg');
fil = imnoise(miami,'gaussian');
figure(1);
subplot(2,1,1); imshow(miami); title('Original');
subplot(2,1,2); imshow(fil); title('Gaussian Noise');
