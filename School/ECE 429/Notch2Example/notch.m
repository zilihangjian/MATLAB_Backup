%Halftone Notch Filter
%Notched Filtering doesn't require zero padding
clc; close all; clear;

original = imread('noisy.png');
%Display Original Image
figure()
imshow(original);

%Zero Pad Image & Translate to Frequency Domain
freqDImage = fftshift(fft2(original));

%Display Frequency Domain DC Centered Image
figure()
imshow(freqDImage);

[Xz,Yz] = size(freqDImage);

%Spectrum Display for Easier Noise View
% https://stackoverflow.com/questions/29235421/find-proper-notch-filter-to-remove-pattern-from-image
norm_img = @(img) (img - min(img(:))) / (max(img(:)) - min(img(:)));
show_spec = @(img) imshow(norm_img(log(abs(img)-min(abs(img(:)))+1.0001)));

figure();
show_spec(freqDImage);

D0 = 5;
%Centers where the HPF are set
%Experimentally Determined
lpf1 = zeros(Xz,Yz);
lpf2 = zeros(Xz,Yz);
lpf3 = zeros(Xz,Yz);
lpf4 = zeros(Xz,Yz);
%Experimentally Determined Values
%Right to Left | X 
%Up and Down | Y
%Upper Left Corner Left [92,100] [X,Y]
%Upper Left Corner Right [108,100]
%Bottom Right Corner Left [150,157]
%Bottom Right Corner Right [166,157]
%Image Center [129,129]

centerX1 = 20.5;
centerY1 = 28.5;
centerX2 = 36.5;

for j = 1:Xz %Moving Along X Coordinate
    for i = 1:Yz %Moving Along Y Coordinate
        lpf1(i,j) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)-centerX1).^2) +...
            ((i - (Yz/2)-centerY1).^2)));%Upper Left Corner 1
        lpf2(i,j) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)-centerX2).^2) +...
            ((i - (Yz/2)-centerY1).^2)));%Upper Left Corner 2
        lpf3(i,j) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)+centerX1).^2) +...
            ((i - (Yz/2)+centerY1).^2)));%Bottom Right Corner 1
        lpf4(i,j) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)+centerX2).^2) +...
            ((i - (Yz/2)+centerY1).^2)));%Bottom Right Corner 2
    end
end

hpf1 = 1 - lpf1;
hpf2 = 1 - lpf2;
hpf3 = 1 - lpf3;
hpf4 = 1 - lpf4;

% figure()
% imshow(hpf1);
% 
% figure()
% imshow(hpf2);
% 
% figure()
% imshow(hpf3);
% 
% figure()
% imshow(hpf4);

notchFilter = hpf1.*hpf2.*hpf3.*hpf4;
figure()
imshow(notchFilter);

%Apply the Notch Filter to the Image

filterImage = freqDImage.*notchFilter;

%Resulting Spectrum
figure();
show_spec(filterImage);

%Time Domain Image
timeDomainResult = ifft2(ifftshift(filterImage));


figure()
imshow(uint8(timeDomainResult));





