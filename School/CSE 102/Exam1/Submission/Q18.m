% Reading the image and converting it to a gray-level image.
aE = imread('Albert_Einstein_Head.jpg');
[aE_256,map256] = gray2ind(aE,256);% A 256 gray-level image
[aE_128,map128] = gray2ind(aE,128);% A 128 gray-level image
[aE_64,map64] = gray2ind(aE,64);% A 64 gray-level image
[aE_32,map32] = gray2ind(aE,32);% A 32 gray-level image
[aE_16,map16] = gray2ind(aE,16);% A 16 gray-level image
[aE_8,map8] = gray2ind(aE,8);% A 8 gray-level image
[aE_4,map4] = gray2ind(aE,4);% A 4 gray-level image
[aE_2,map2] = gray2ind(aE,2);% A 2 gray-level image

figure(1);
subplot(2,2,1); subimage(aE_256,map256); title('256 Gray Levels');
subplot(2,2,2); subimage(aE_128,map128); title('128 Gray Levels');
subplot(2,2,3); subimage(aE_64,map64);   title('64 Gray Levels');
subplot(2,2,4); subimage(aE_32,map32);   title('32 Gray Levels');

figure(2);
subplot(2,2,1); subimage(aE_16,map16); title('16 Gray Levels');
subplot(2,2,2); subimage(aE_8,map8);   title('8 Gray Levels');
subplot(2,2,3); subimage(aE_4,map4);   title('4 Gray Levels'),
subplot(2,2,4); subimage(aE_2,map2);   title('2 Gray Levels')