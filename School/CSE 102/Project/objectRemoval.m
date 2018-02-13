function [] = objectRemoval(imageName)
%function [] = objectRemoval(imageName)
%Description, this function takes a grayscale image and performs object
%removal through ROI identification and regionfill
%Inputs, the input to the function is either a grayscale image or will be
%converted to a grayscale image for the process of image removal 

%First Method
image = imread(imageName);
figure(1); imshow(image);
grayImage = rgb2gray(image);
mask = roipoly(grayImage);
newImage = regionfill(grayImage,mask);
figure(3); imshow(newImage);
close all;
figure(1); imshow(image);
figure(2); imshow(grayImage);
figure(3); imshow(newImage);

pause();




end