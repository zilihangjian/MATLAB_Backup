%Part2 Spatial Resolution

emu = imread('emu.jfif');
cman = imread('cameraman.tif');
baby = imread('baby.bmp');
rose = imread('rose.tif');

%emu
figure();
subplot(1,6,1);
imshow(emu); title('Original');

emu1 = imresize(emu,1/2);
emu11 = imresize(emu1,2);
subplot(1,6,2);
imshow(emu11); title('1/2 Scaled');

emu2 = imresize(emu1,1/2);
emu22 = imresize(emu2,4);
subplot(1,6,3);
imshow(emu22); title('1/4 Scaled');

emu3 = imresize(emu2,1/2);
emu33 = imresize(emu3,8);
subplot(1,6,4);
imshow(emu33); title('1/8 Scaled');

emu4 = imresize(emu3,1/2);
emu44 = imresize(emu4,16);
subplot(1,6,5);
imshow(emu44); title('1/16 Scaled');


emu5 = imresize(emu4,1/2);
emu55 = imresize(emu5,32);
subplot(1,6,6);
imshow(emu55); title('1/32 Scaled');

%Cameraman
figure()
subplot(1,6,1);
imshow(cman); title('Original');

cman1 = imresize(cman,1/2);
subplot(1,6,2);
cman11 = imresize(cman1,2);
imshow(cman11); title('1/2 Scaled');

cman2 = imresize(cman1,1/2);
cman22 = imresize(cman2,4);
subplot(1,6,3);
imshow(cman22); title('1/4 Scaled');

cman3 = imresize(cman2,1/2);
cman33 = imresize(cman3,8);
subplot(1,6,4);
imshow(cman33); title('1/8 Scaled');

cman4 = imresize(cman3,1/2);
cman44 = imresize(cman4,16);
subplot(1,6,5);
imshow(cman44); title('1/16 Scaled');

cman5 = imresize(cman4,1/2);
cman55 = imresize(cman5,32);
subplot(1,6,6);
imshow(cman55); title('1/32 Scaled');

%Baby
figure()
subplot(1,6,1);
imshow(baby); title('Original');

baby1 = imresize(baby,1/2);
baby11 = imresize(baby1,2);
subplot(1,6,2);
imshow(baby11); title('1/2 Scaled');

baby2 = imresize(baby1,1/2);
baby22 = imresize(baby2,4);
subplot(1,6,3);
imshow(baby22); title('1/4 Scaled');

baby3 = imresize(baby2,1/2);
baby33 = imresize(baby3,8);
subplot(1,6,4);
imshow(baby33); title('1/8 Scaled');

baby4 = imresize(baby3,1/2);
baby44 = imresize(baby4,16);
subplot(1,6,5);
imshow(baby44); title('1/16 Scaled');

baby5 = imresize(baby4,1/2);
baby55 = imresize(baby5,32);
subplot(1,6,6);
imshow(baby55); title('1/32 Scaled');


%Baby
figure()
subplot(1,6,1);
imshow(rose); title('Original');

rose1 = imresize(rose,1/2);
rose11 = imresize(rose1,2);
subplot(1,6,2);
imshow(rose11); title('1/2 Scaled');

rose2 = imresize(rose1,1/2);
rose22 = imresize(rose2,4);
subplot(1,6,3);
imshow(rose22); title('1/4 Scaled');

rose3 = imresize(rose2,1/2);
rose33 = imresize(rose3,8);
subplot(1,6,4);
imshow(rose33); title('1/8 Scaled');

rose4 = imresize(rose3,1/2);
rose44 = imresize(rose4,16);
subplot(1,6,5);
imshow(rose44); title('1/16 Scaled');

rose5 = imresize(rose4,1/2);
rose55 = imresize(rose5,32);
subplot(1,6,6);
imshow(rose55); title('1/32 Scaled');