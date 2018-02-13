clc; clear; close all; 
monkey = imread('dusk leaf monkey.jpg');
monkey = rgb2gray(monkey);
monkey = im2double(monkey);
figure(); h = imshow(monkey);

impixelinfo(h); 
%Top left (100,33) Left (83,51) Bottom Left (99,77)
%Bottom Right (141,80) Right (155,66) Top Right (136,35)
xi = [263 269 426 564 570 426];
yi = [133 239 327 256 104 19];

roi = roipoly(monkey,xi,yi);
figure(); imshow(roi);

%Average Filter
figure(1);
avg = fspecial('average',15);
avgIm = roifilt2(avg,monkey,roi);
subplot(1,3,1); imshow(avgIm); title('Average Filter');

%Unsharp Filter
unshrp = fspecial('unsharp');
unshrpIm = roifilt2(unshrp,monkey,roi);
subplot(1,3,2); imshow(unshrpIm); title('Unsharp Filter');

%Gaussian of Laplacian
logFil = fspecial('log');
logIm = roifilt2(logFil,monkey,roi);
subplot(1,3,3); imshow(logIm); title('Log Filter');