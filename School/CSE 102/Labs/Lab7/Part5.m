clc; clear; close all;
sp = imread('s&p.png');
figure(1);
medFilter = medfilt2(sp, [5 5]);
subplot(3,1,1); imshow(medFilter); title('Median Filter');

avg = fspecial('average',[5 5]);
avgFilter = imfilter(sp,avg);
subplot(3,1,2); imshow(avgFilter); title('Average Filter');

medFilter2 = medfilt2(avgFilter, [5 5]);
subplot(3,1,3); imshow(medFilter2); title('Average + Median Filter');
