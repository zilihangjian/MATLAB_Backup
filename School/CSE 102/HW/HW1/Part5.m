% 5. Apply log transformation to the fouriertransform image. 
% What do you observe in the output image compared to the input image [1]
clc; clear;
original = imread('fouriertransform.tif');
figure(1); imshow(original);title('Original');xlabel('x'); ylabel('y');
logTransform = log(1+double(original));
logTransform = im2uint8(mat2gray(logTransform));
figure(2); imshow(logTransform); title('Log Transform');
xlabel('x'); ylabel('y');