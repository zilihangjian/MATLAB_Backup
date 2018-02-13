% 4. For the given (saltandpepper, monalisa) noisy image, clear the noise 
% using different filter function like average and median filter. [2+2] 
clc; clear;
%Monalisa Image
monalisa = imread('monalisa.png');
grayMonalisa = rgb2gray(monalisa);
figure(1); imshow(monalisa);title('Original');xlabel('x'); ylabel('y');
f1 = fspecial('average');
monafil = imfilter(monalisa,f1);
figure(2); imshow(monafil);title('Average Filter');...
    xlabel('x'); ylabel('y');
monafil2 = medfilt2(grayMonalisa);
figure(3); imshow(monafil2);title('Median Filter');...
    xlabel('x'); ylabel('y');

%Salt & Pepper
saltpepper = imread('saltandpepper.tif');
figure(4); imshow(saltpepper); title('Original');xlabel('x'); ylabel('y');
f2 = fspecial('average');
spfilter = imfilter(saltpepper,f2);
figure(5); imshow(spfilter);title('Average Filter');...
    xlabel('x'); ylabel('y');
spfilter2 = medfilt2(saltpepper);
figure(6); imshow(spfilter2);title('Median Filter');...
    xlabel('x'); ylabel('y');

