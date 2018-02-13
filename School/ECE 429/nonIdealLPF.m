%Non Ideal Low Pass Filter
clc; close all; clear;

original = imread('Miami.jpg');
original = rgb2gray(original);
%Display Original Image
figure()
imshow(original);

[Xo,Yo] = size(original);%s

%Zero Pad Image & Translate to Frequency Domain
zPImage = fft2(original, 2*Xo,2*Yo);

%Display Frequency Domain Image
figure()
imshow(zPImage);

%Center DC Point
freqCent = fftshift(zPImage);

%Display Frequency Domain DC Centered Image
figure()
imshow(freqCent);

[Xz,Yz] = size(freqCent);

D0 = 100;
lpf = zeros(Xz,Yz);
for j = 1:Xz %Moving Along X Coordinate
    for i = 1:Yz %Moving Along Y Coordinate
        lpf(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)).^2) + ((i - (Yz/2)).^2)));
    end
end

hpf = 1 - lpf;

%Display Low Pass Filter
figure()
imshow(lpf);

%Display High Pass Filter
figure()
imshow(hpf);