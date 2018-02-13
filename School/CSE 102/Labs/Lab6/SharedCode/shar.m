close all;
% read the image
a=imread('moon.tif');
figure(1);imshow(a);
% double the image
a2=im2double(a);
% Create Filter using this value or apply Laplacian Filter 
w=[0 1 0; 1 -4 1; 0 1 0];
% Apply Filter over image
g1=imfilter(a2,w,'replicate');
figure(2);imshow(g1,[]);
%Subtract the image from Laplacian processed image
g=a2-g1;
figure(3);imshow(g);

%------------------------------------------------------

