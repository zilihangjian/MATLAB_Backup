clc; close all; clear;
pearson = imread('pearsonhall.jpg');
pearson = im2double(pearson);
pearson = rgb2gray(pearson);

lapf = [0 1 0; 1 -4 1; 0 1 0];
p2 = imfilter(pearson, lapf,'replicate');
pLaplace = imsubtract(pearson,p2);

c1 = imnoise(pearson,'gaussian');
c2 = imnoise(pearson,'salt & pepper');
lap1 = imnoise(pLaplace,'gaussian');
lap2 = imnoise(pLaplace,'salt & pepper');

sobel1 = edge(c1,'sobel');
prewitt1 = edge(c1,'prewitt');
roberts1 = edge(c1,'roberts');
log1 = edge(c1,'log');
zCross1 = edge(lap1,'zerocross');
canny1 = edge(c1,'canny');
marrH1 = edge(log1,'zerocross');

sobel2 = edge(c2,'sobel');
prewitt2 = edge(c2,'prewitt');
roberts2 = edge(c2,'roberts');
log2 = edge(c2,'log');
zCross2 = edge(lap2,'zerocross');
canny2 = edge(c2,'canny');
marrH2 = edge(log2,'zerocross');

%Plot
figure();
subplot(2,2,1);imshow(c1);title('Original'); 
subplot(2,2,2); imshow(roberts1);title('Roberts');
subplot(2,2,3); imshow(prewitt1);title('Prewitt');
subplot(2,2,4); imshow(sobel1);title('Sobel');

figure();
subplot(2,2,1); imshow(log1);title('Laplacian');
subplot(2,2,2);imshow(zCross1);title('Zero Crossing'); 
subplot(2,2,3); imshow(marrH1);title('Marr Hildreth');
subplot(2,2,4);imshow(canny1); title('Canny'); 

figure();
subplot(2,2,1);imshow(c2);title('Original'); 
subplot(2,2,2); imshow(roberts2);title('Roberts');
subplot(2,2,3); imshow(prewitt2);title('Prewitt');
subplot(2,2,4); imshow(sobel2);title('Sobel');

figure();
subplot(2,2,1); imshow(log2);title('Laplacian');
subplot(2,2,2);imshow(zCross2);title('Zero Crossing'); 
subplot(2,2,3); imshow(marrH2);title('Marr Hildreth');
subplot(2,2,4);imshow(canny2); title('Canny'); 






