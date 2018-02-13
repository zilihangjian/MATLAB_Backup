clc; close all; clear;
A = imread('Miami.jpg');
figure()
imshow(A);
laplacianKernel1 = [0,1,0;1,-4,1;0,1,0];
laplacianKernel2 = [1,1,1;1,-8,1;1,1,1];
laplacianKernel3 = [1,4,1;4,-20,4;1,4,1];
figure()
B = histeq(A);
imshow(B)

lapl1 = imfilter(A,laplacianKernel1);
figure()
imshow(lapl1);
lapl2 = imfilter(A,laplacianKernel2);
figure()
imshow(lapl2);
lapl3 = imfilter(A,laplacianKernel3);
figure()
imshow(lapl3);

sobely = [-1,-2,-1;0,0,0;1,2,1];
sobelx = [-1,0,1;-2,0,2;-1,0,1];

figure()
sobeX = imfilter(A,sobelx);
imshow(sobeX);
figure()
sobeY = imfilter(A,sobely);
imshow(sobeY);

figure()
sobeE = 0.75*(abs(sobeY) + abs(sobeX)); 
imshow(sobeE);

figure()
embossKernel = [-4,-4,0;-4,1,4;0,4,4];
emboss = imfilter(rgb2gray(A),embossKernel);
imshow(emboss)

figure()
sharpenImage = imfilter(A,laplacianKernel1);
imshow(sharpenImage + A);


figure()
sharpenImage = imfilter(A,laplacianKernel2);
imshow(sharpenImage + A);


figure()
sharpenImage = imfilter(A,laplacianKernel3);
imshow(sharpenImage + A);

figure()
sharpenImage = imfilter(A,laplacianKernel1);
imshow(A - sharpenImage);


figure()
sharpenImage = imfilter(A,laplacianKernel2);
imshow(A - sharpenImage);


figure()
sharpenImage = imfilter(A,laplacianKernel3);
imshow(A - sharpenImage);
