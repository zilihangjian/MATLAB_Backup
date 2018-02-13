clc; close all; clear;
camera = imread('cameraman.png');
camera = im2double(camera);
lapf = [0 1 0; 1 -4 1; 0 1 0];
c2 = imfilter(camera, lapf,'replicate');
cLaplace = imsubtract(camera,c2);

sobel = edge(camera,'sobel');
prewitt = edge(camera,'prewitt');
roberts = edge(camera,'roberts');
log = edge(camera,'log');
zCross = edge(cLaplace,'zerocross');
canny = edge(camera,'canny');
marrH = edge(log,'zerocross');

%Plot
figure();
subplot(2,2,1); imshow(camera);title('Original'); 
subplot(2,2,2); imshow(roberts);title('Roberts');
subplot(2,2,3); imshow(prewitt);title('Prewitt');
subplot(2,2,4); imshow(sobel);title('Sobel');

figure();
subplot(2,2,1); imshow(log);title('Laplacian of Gaussian');
subplot(2,2,2);imshow(zCross);title('Zero Crossing of Laplacian'); 
subplot(2,2,3); imshow(marrH);title('Marr Hildreth');
subplot(2,2,4);imshow(canny); title('Canny'); 