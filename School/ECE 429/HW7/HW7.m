clc; close all; clear;
image = imread('Still_Live.jpg');

figure()
imshow(image);
%Approximate RGB value for RED [190, 61, 65]
appleRGB = [190,61,65]./255;
[length,width,depth] = size(image);
W = 0.50;
slicedImage = zeros(length,width,depth);
for i = 1:length
    for j = 1:width
        pixelIM = double([image(i,j,1)/255, image(i,j,2)/255, image(i,j,3)/255]);
        keyboard
        if(abs(pixelIM - appleRGB)) > W/2  
            slicedImage(i,j,1:3) = 0.50;
        else
            slicedImage(i,j,1:3) = pixelIM;
        end
    end
end
% slicedImage = double(slicedImage);
figure()
image(slicedImage);