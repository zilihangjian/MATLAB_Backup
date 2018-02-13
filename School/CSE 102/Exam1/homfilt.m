function res = homfilt( im, cutoff, order, lowgain, highgain )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

u = im2uint8(im);
height = size(im,1);
width = size(im,2);
[x, y] = meshgrid(-floor(width/2):floor((width-1)/2),...
                  -floor(height/2):floor((height -1)/2));
lbutter = 1./(1+(sqrt(2)-1)*((x.^2+y.^2)/cutoff^2).^order);

u(find(u == 0)) = 1;
lg = log(double(u));
ft = fftshift(fft2(lg));
hboost = lowgain+(highgain-lowgain)*(1-lbutter);
b = hboost.*ft;
ib = abs(ifft2(b));
res = exp(ib);
end


