%Non Ideal Low Pass Filter
clc; close all; clear;

original = imread('testImage1.png');
%Display Original Image
figure()
imshow(original);

eqImage = histeq(original);
figure()
imshow(eqImage);

[Xo,Yo,Zo] = size(original);%s

%Zero Pad Image & Translate to Frequency Domain
zPImage = fft2(eqImage, 2*Xo,2*Yo);

%Display Frequency Domain Image
figure()
imshow(zPImage);

%Center DC Point
freqCent = fftshift(zPImage);

%Display Frequency Domain DC Centered Image
figure()
imshow(freqCent);

%Spectrum Display for Easier Noise View
% https://stackoverflow.com/questions/29235421/find-proper-notch-filter-to-remove-pattern-from-image
norm_img = @(img) (img - min(img(:))) / (max(img(:)) - min(img(:)));
show_spec = @(img) imshow(norm_img(log(abs(img)-min(abs(img(:)))+1.0001)));

figure();
show_spec(freqCent);

[Xz,Yz,Zz] = size(freqCent);

figure()
imshow(original(:,:,1));

figure()
imshow(original(:,:,2));

figure()
imshow(original(:,:,3));
D0 = 50;
hpf = zeros(Xz,Yz);
for j = 1:Xz %Moving Along X Coordinate
    for i = 1:Yz %Moving Along Y Coordinate
        hpf(j,i) = 1 - exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)).^2) + ((i - (Yz/2)).^2)));
    end
end

%Display High Pass Filter
figure()
imshow(hpf);

filterImageC1 = real(zPImage(:,:,1).*(hpf));
filterImageC2 = real(zPImage(:,:,2).*(hpf));
filterImageC3 = real(zPImage(:,:,3).*(hpf));

outputImageC1 = ifftshift(ifft2(filterImageC1));
outputImageC2 = ifftshift(ifft2(filterImageC2));
outputImageC3 = ifftshift(ifft2(filterImageC3));

figure()
imshow(uint8(outputImageC1((Xo:end),(Yo:end))));
CH1 = uint8(outputImageC1((Xo:end),(Yo:end)));
figure()
imshow(uint8(outputImageC2((Xo:end),(Yo:end))));
CH2 = uint8(outputImageC2((Xo:end),(Yo:end)));
figure()
imshow(uint8(outputImageC3((Xo:end),(Yo:end))));
CH3 = uint8(outputImageC3((Xo:end),(Yo:end)));


outputImage = cat(3,CH1,CH2,CH3);
figure()
imshow(uint8(outputImage));