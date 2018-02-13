clc; clear; close all;
leftStream = imread('left_stream.tif');
figure(1); imshow(leftStream);
mask = roipoly(leftStream);
red = immultiply(mask,leftStream(:,:,1));
green = immultiply(mask,leftStream(:,:,2));
blue = immultiply(mask,leftStream(:,:,3));
concat = cat(3,red,green,blue);
figure(2); subplot(1,2,1); imshow(concat);
avgFilter = fspecial('average',5);
smoothConcat = imfilter(concat,avgFilter);
subplot(1,2,2); imshow(smoothConcat);