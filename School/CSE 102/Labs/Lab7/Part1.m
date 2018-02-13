% Reading the image and converting it to a gray-level image.
rose = imread('rose.jpg');
rose = rgb2gray(rose);
[rose256,map256] = gray2ind(rose,256);% A 256 gray-level image
[rose128,map128] = gray2ind(rose,128);% A 128 gray-level image
[rose64,map64] = gray2ind(rose,64);% A 64 gray-level image
[rose32,map32] = gray2ind(rose,32);% A 32 gray-level image
[rose16,map16] = gray2ind(rose,16);% A 16 gray-level image
[rose8,map8] = gray2ind(rose,8);% A 8 gray-level image
[rose4,map4] = gray2ind(rose,4);% A 4 gray-level image
[rose2,map2] = gray2ind(rose,2);% A 2 gray-level image

figure(1);
subplot(2,2,1); subimage(rose256,map256); title('256 Gray Levels');
subplot(2,2,2); subimage(rose128,map128); title('128 Gray Levels');
subplot(2,2,3); subimage(rose64,map64);   title('64 Gray Levels');
subplot(2,2,4); subimage(rose32,map32);   title('32 Gray Levels');

figure(2);
subplot(2,2,1); subimage(rose16,map16); title('16 Gray Levels');
subplot(2,2,2); subimage(rose8,map8);   title('8 Gray Levels');
subplot(2,2,3); subimage(rose4,map4);   title('4 Gray Levels'),
subplot(2,2,4); subimage(rose2,map2);   title('2 Gray Levels')