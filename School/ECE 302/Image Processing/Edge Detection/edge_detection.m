%Image Processing Edge Detection
clc; clear;
close all;
imtool close all;
mountain = imread('mountain.jpg');
figure()
imshow(mountain);
grayMountain = mountain(:, :, 1); % Take green channel.
imshow(grayMountain);
edge1 = edge(grayMountain, 'canny');
edge2 = edge(grayMountain, 'sobel');
edge3 = edge(grayMountain, 'roberts');
figure();
imshow(edge1);
title('canny');
figure();
imshow(edge2); 
title('sobel');
figure();
imshow(edge3);
title('prewitt');
