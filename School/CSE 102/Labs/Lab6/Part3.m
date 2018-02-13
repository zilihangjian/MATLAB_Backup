%Rotation
close all; clc;
dipXE = imread('DIPXE.tif');
moon = imread('blurrymoon.tif');
figure(); imshow(dipXE); title('Original');
bil45 = imrotate(dipXE,45,'bilinear');
bil90 = imrotate(dipXE,90,'bilinear');
bil180 = imrotate(dipXE,180,'bilinear');
bil360 = imrotate(dipXE,360,'bilinear');
figure();title('Bilinear');
subplot(2,2,1); imshow(bil45);
subplot(2,2,2); imshow(bil90);
subplot(2,2,3); imshow(bil180);
subplot(2,2,4); imshow(bil360);

near45 = imrotate(dipXE,45,'nearest');
near90 = imrotate(dipXE,90,'nearest');
near180 = imrotate(dipXE,180,'nearest');
near360 = imrotate(dipXE,360,'nearest');

figure();title('Nearest');
subplot(2,2,1); imshow(near45);
subplot(2,2,2); imshow(near90);
subplot(2,2,3); imshow(near180);
subplot(2,2,4); imshow(near360);

bi45 = imrotate(dipXE,45,'bicubic');
bi90 = imrotate(dipXE,90,'bicubic');
bi180 = imrotate(dipXE,180,'bicubic');
bi360 = imrotate(dipXE,360,'bicubic');
figure();title('Nearest');
subplot(2,2,1); imshow(bi45);
subplot(2,2,2); imshow(bi90);
subplot(2,2,3); imshow(bi180);
subplot(2,2,4); imshow(bi360);

%Part b
figure(); imshow(moon); title('Original');
moon90 = imrotate(moon,90);
figure(); imshow(moon90); title('imrotate: 90');
moonFlip = fliplr(moon);
figure(); imshow(moonFlip); title('fliplr');
