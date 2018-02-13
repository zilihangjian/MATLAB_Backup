clc; clear; close all;
sp = imread('Miami.jpg');
fil = imnoise(sp,'salt & pepper', .30);
figure(1);
subplot(2,1,1);imshow(sp);title('Original');
subplot(2,1,2);imshow(fil);title('Salt and Pepper');