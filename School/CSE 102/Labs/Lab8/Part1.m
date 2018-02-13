clc; close all; clear;
hgd = imread('homographic_dark.jpg');
hgd = rgb2gray(hgd);
hgd = im2double(hgd);
figure(1); imshow(hgd); title('Original');
mFilter = homfilt(hgd,10,2,.5,2);
figure(2); imshow(mFilter/16); title('Filtered');
