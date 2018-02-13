clear;
close all;
imA = imread('Miami.jpg');
figure();
image(imA);
imB = rgb2gray(imA);
figure()
image(imB);
histA = imhist(imA);
figure()
image(histA);
histEA = histeq(imA);
figure()
image(histEA);



histB = imhist(imB);
figure()
image(histB);
histEB = histeq(imB);
figure()
image(histEB);

histB;




% colormap(gray(256));
% figure()
% imshow(imB);
% figure();
% imshow(imA);

