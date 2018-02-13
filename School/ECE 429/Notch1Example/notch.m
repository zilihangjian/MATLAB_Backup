%Halftone Notch Filter
%Notched Filtering doesn't require zero padding
clc; close all; clear;

original = imread('halftone.png');
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

D0 = 20;
%Centers where the HPF are set
%Experimentally Determined
centerY1 = 100;
centerX1 = 68;

lpf1 = zeros(Xz,Yz);
lpf2 = zeros(Xz,Yz);
lpf3 = zeros(Xz,Yz);
lpf4 = zeros(Xz,Yz);

for j = 1:Xz %Moving Along X Coordinate
    for i = 1:Yz %Moving Along Y Coordinate
        lpf1(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)-centerX1).^2) +...
            ((i - (Yz/2)-centerY1).^2)));%Upper Left Corner
        lpf2(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)+centerX1).^2) +...
            ((i - (Yz/2)+centerY1 ).^2)));%Upper Right Corner
        lpf3(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)-centerX1).^2) +...
            ((i - (Yz/2)+centerY1).^2)));%Bottom Left Corner
        lpf4(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)+centerX1).^2) +...
            ((i - (Yz/2)-centerY1).^2)));%Bottom Right Corner
    end
end

hpf1 = 1 - lpf1;
hpf2 = 1 - lpf2;
hpf3 = 1 - lpf3;
hpf4 = 1 - lpf4;

figure()
imshow(hpf1);

figure()
imshow(hpf2);

figure()
imshow(hpf3);

figure()
imshow(hpf4);

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
imshow(timeDomainResult);





