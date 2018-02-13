clc; close all; clear;
%Adaptive Local Noise Reduction Filter
image = imread('problem1_3.jpg');
figure();
imshow(image);
[M,N] = size(image);
numPixels = M*N;
image = double(image);

%Window Size Declaration
wM = 5;
wN = 5;

%Zero Pad Image
zImage = padarray(image,[round(wM/2),round(wN/2)]);

%Variable Pre-Allocation 
localVar = zeros(M,N);
localMean = zeros(M,N);
for i = 1:(M-wM-1)
    for j = 1:(N-wN-1)
        vect = reshape(zImage(i:i+(wM-1),j:j+(wN-1)),[1,(wM*wN)]);
        localMean(i,j) = mean(vect);
        localVar(i,j) = mean(vect.^2)-mean(vect).^2;
    end
end

noiseVar = sum(localVar(:))/numPixels;
localVar = max(localVar,noiseVar);
filterOutput = uint8(image - ((noiseVar.^2)./(localVar.^2)).*(image - localMean));
figure()
imshow(image);
title('Original Noisy Image');
figure()
imshow(filterOutput)
title('Filtered Image');


%Filtering Iteration 2
%High Pass Filtering

%Zero Pad Image & Translate to Frequency Domain
ZPhpf = fftshift(fft2(filterOutput, 2*M,2*N));

%Display Frequency Domain DC Centered Image
figure()
imshow(ZPhpf);

%Spectrum Display for Easier Noise View
% https://stackoverflow.com/questions/29235421/find-proper-notch-filter-to-remove-pattern-from-image
norm_img = @(img) (img - min(img(:))) / (max(img(:)) - min(img(:)));
show_spec = @(img) imshow(norm_img(log(abs(img)-min(abs(img(:)))+1.0001)));

figure();
show_spec(ZPhpf);

[Xz,Yz] = size(ZPhpf);

D0 = 5;
lpf = zeros(Xz,Yz);
for j = 1:Xz %Moving Along X Coordinate
    for i = 1:Yz %Moving Along Y Coordinate
        lpf(j,i) = exp(-0.50.*(D0.^-2).*(double((j-(Xz/2)).^2) + ((i - (Yz/2)).^2)));
    end
end

hpf = 1 - lpf;


hpfFilterImage = ZPhpf.*hpf;

%Time Domain Image
timeDomainResult = ifft2(ifftshift(hpfFilterImage));
timeDomainResult = timeDomainResult(1:M,1:N);
figure()
imshow(timeDomainResult);


outputIter2 = uint8(filterOutput) + uint8(real(timeDomainResult));
figure()
imshow(outputIter2);