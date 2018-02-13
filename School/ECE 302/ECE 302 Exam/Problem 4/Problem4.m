%Problem 4
clc; clear;
picture = imread('ray_traced_bottle_original.tif');
figure();
imshow(picture);

edge2 = edge(picture, 'sobel');
figure();
imshow(edge2);