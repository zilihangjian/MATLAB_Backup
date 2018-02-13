close all;
% read the image
a=imread('hubble.tif');
figure(1);imshow(a);
% double the image
a2=im2double(a);
% Create Filter using this value or apply Laplacian Filter 
J1 = fspecial('average', [15 15]);
K1 = imfilter(a,J1,'replicate');
figure(2);imshow(K1,[]);




[ht,wd]=size(K1);

opim=zeros(ht,wd,'uint8');                          % Take Output variable

for i=1:ht 
    for j=1:wd
        int=K1(i,j);
        if int<=120                                 % Define Threshol level
            opim(i,j)=0;
        else                                        % Thresholding
            opim(i,j)=255;
        end;
    end;
end;
figure(3);imshow(opim)
