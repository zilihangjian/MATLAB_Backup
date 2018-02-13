clc; clear;
close all;
imtool close all;

e = imread('einstein.tif');
figure();
title('original');
imshow(e);
figure()
e_adjust = imadjust(e);
title('imadjust');
imshow(e_adjust);
e_hist = histeq(e);
figure()
title('histeq');
imshow(e_hist);

figure; 
imhist(e,64);
figure();
imhist(e_hist,64);

%Color Contrast 
color  = imread('1367245355867.jpg');

srgb2lab = makecform('srgb2lab');%First color transformation function
lab2srgb = makecform('lab2srgb');%Second color transformation function
colorlab= applycform(color, srgb2lab); % convert to L*a*b*

max_luminosity = 100;
L = colorlab(:,:,1)/max_luminosity;

colorimadjust = colorlab;
colorimadjust(:,:,1) = imadjust(L)*max_luminosity;
colorimadjust = applycform(colorimadjust, lab2srgb);

figure, imshow(color);
title('Original');

figure, imshow(colorimadjust);
title('Imadjust');



