clc; clear; close all;
%Part 9
%a 
flowers = imread('imageflw.bmp'); 
figure(1); imshow(flowers); title('Original');xlabel('x'); ylabel('y');

LEN = 31;
THETA = 11;
PSF = fspecial('motion',LEN,THETA);
blurFlower = imfilter(flowers,PSF,'circular','conv');
figure(2); imshow(blurFlower); title('Blurred Image');...
    xlabel('x'); ylabel('y');

wfilter1 = deconvwnr(blurFlower,PSF);
figure(3);imshow(wfilter1); title('Wiener Filtered Image');...
    xlabel('x'); ylabel('y');

%b
plate = imread('blurliscenseplate.bmp');
figure(4);imshow(plate);title('Original Image');xlabel('x'); ylabel('y');
 
LEN = 15;
THETA = 30;
PSF = fspecial('motion',LEN,THETA);

blurPlate = imfilter(plate,PSF,'circular','conv');
figure(5); imshow(blurPlate); title('Blurred Image');xlabel('x');...
    ylabel('y');

wfilter2 = deconvwnr(blurPlate,PSF);
figure(6);imshow(wfilter2); title('Wiener Filtered Image');xlabel('x');...
    ylabel('y');
