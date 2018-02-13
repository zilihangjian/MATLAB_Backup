clc; clear;
%Part 3
rose = imread('rose.tif');
figure(2); imshow(rose);xlabel('x'); ylabel('y'); title('Original');
rrose = imrotate(rose,180);
figure(4);imshow(rrose);xlabel('x'); ylabel('y'); title('Rotated');
