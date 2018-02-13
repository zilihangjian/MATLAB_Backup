clc; clear all; clear;
paperclip = imread('paper clips.jpg');
birds = imread('flying birds.jpg');

%Threshold 1
paperclip = im2double(paperclip);
paperclip = rgb2gray(paperclip);
figure(1); imshow(paperclip); title('Original');
level = graythresh(paperclip);
figure(2); imshow(im2bw(paperclip,level)); title('Threshold');

%Threshold 2
%Threshold 1
birds = im2double(birds);
birds = rgb2gray(birds);
figure(3); imshow(birds); title('Original');
figure(4); imshow(im2bw(birds,.3)); title('Threshold');