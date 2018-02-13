clc; clear; close all; 
camera = imread('cameraman.tif');
figure(); h = imshow(camera);
impixelinfo(h); 
%Top left (100,33) Left (83,51) Bottom Left (99,77)
%Bottom Right (141,80) Right (155,66) Top Right (136,35)
xi = [100 83 99 141 155 136];
yi = [33 51 77 80 66 35];

roi = roipoly(camera,xi,yi);
figure(); imshow(roi);

%Average Filter
figure(1);
avg = fspecial('average',15);
avgIm = roifilt2(avg,camera,roi);
subplot(1,3,1); imshow(avgIm); title('Average Filter');

%Unsharp Filter
unshrp = fspecial('unsharp');
unshrpIm = roifilt2(unshrp,camera,roi);
subplot(1,3,2); imshow(unshrpIm); title('Unsharp Filter');

%Gaussian of Laplacian
logFil = fspecial('log');
logIm = roifilt2(logFil,camera,roi);
subplot(1,3,3); imshow(logIm); title('Log Filter');