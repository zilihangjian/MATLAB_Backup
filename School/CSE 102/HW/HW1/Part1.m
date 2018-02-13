% 1. Take the chicken image. Divide the image by 4. What do you observe? 
% Compute histogram of the image. Take the output image and apply histogram 
% equalization, then show the output with histogram. Show that a second pass 
% of histogram equalization will produce exactly the same result as the 
% first pass. [3]
clc; clear;
imchicken = imread('chickens.bmp');
figure(1); imshow(imchicken);title('Original'); xlabel('x'); ylabel('y');
fourthChicken = imchicken/4;
figure(2); imshow(fourthChicken);title('Chicken Divide by 4'); xlabel('x');...
    ylabel('y');
%The fourthChicken is significantly darker, as each pixel value has been
%divided by four, making the overall image darker

figure(3); histogram(imchicken);title('Histogram Chicken'); xlabel('x');...
    ylabel('y');
figure(4); histogram(fourthChicken);title('Histogram Darker Chicken'); ...
    xlabel('x'); ylabel('y');


grayChicken = rgb2gray(imchicken);
histChicken = histeq((grayChicken));
figure(5); imshow(histChicken);title('Histeq Chicken'); xlabel('x'); ...
    ylabel('y');

grayFourthChicken = rgb2gray(fourthChicken);
histDarkChicken = histeq(grayFourthChicken);
figure(6); imshow(histChicken);title('Histeq Darker Chicken');...
    xlabel('x'); ylabel('y');

figure(7); histogram(histDarkChicken);title('Histogram of Histeq');...
     xlabel('x'); ylabel('y');

%Recheck
histDarkChicken2 = histeq(histDarkChicken);
figure(8); imshow(histDarkChicken2);title('Second Histeq');...
     xlabel('x'); ylabel('y');
figure(9); histogram(histDarkChicken2);title('Second Histeq Histogram');...
     xlabel('x'); ylabel('y');