%Halftone Notch Filter
%Notched Filtering doesn't require zero padding
clc; close all; clear;

original = imread('problem3_5_under.jpg');
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

D0 = 25;
%Centers where the HPF are set
%Experimentally Determined
centerY1 = 169;
centerX1 = 92;

centerY2 = 348;
centerX2 = 80;
lpf1 = zeros(Xz,Yz);
lpf2 = zeros(Xz,Yz);
lpf3 = zeros(Xz,Yz);
lpf4 = zeros(Xz,Yz);

for j = 1:Xz %Moving Along X Coordinate
    for i = 1:Yz %Moving Along Y Coordinate
        lpf1(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)+centerX1).^2) +...
            ((i - (Yz/2)+centerY1).^2)));%Upper Left Corner
        lpf2(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)-centerX1).^2) +...
            ((i - (Yz/2)-centerY1 ).^2)));%Upper Right Corner
        lpf3(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)+centerX2).^2) +...
            ((i - (Yz/2)-centerY2).^2)));%Bottom Left Corner
        lpf4(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)-centerX2).^2) +...
            ((i - (Yz/2)+centerY2).^2)));%Bottom Right Corner
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
timeDomainResult = uint8(ifft2(ifftshift(filterImage)));

figure()
imshow(timeDomainResult);

wM = 5;
wN = 5;
for i = 1:wM:(M-wM-1)
    for j = 1:wN:(N-wN-1)
        %(w(i,j) = (mean(g(x,y)*eta(x,y)) - mean(g(x,y))*mean(eta(x,y)))./...
        %(mean(eta(x,y).^2)*mean(eta(x,y).^2) 
        %g(x,y) | corrupted image before notch filter
        %eta(x,y) 
        w(i,j) = 
       
        
        vect = reshape(zImage(i:i+(wM-1),j:j+(wN-1)),[1,(wM*wN)]);
        localMean(i,j) = mean(vect);
        localVar(i,j) = mean(vect.^2)-mean(vect).^2;
    end
end





