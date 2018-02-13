clear;
close all
A = imread('Miami_Brick.jpg');
figure
image(A)
B=rgb2gray(A);

%Scale Image
scale_x = 2;
scale_y = 1.5;
T1 = maketform('affine',[scale_x, 0, 0; 0, scale_y, 0; 0, 0, 1]);
transS= imtransform(B, T1);
figure()
imshow(transS);

%Rotation 1
T2 = maketform('affine',[cosd(30), sind(30), 0; -sind(30), cosd(30), 0; 0, 0, 1]);
transR = imtransform(B, T2);
figure()
imshow(transR);

%Rotation 2
T3 = maketform('affine',[cosd(-30), sind(-30), 0; -sind(-30), cosd(-30), 0; 0, 0, 1]);
transR2= imtransform(B, T3);
figure()
imshow(transR2);

%Shear 1 | y = 1.5
S1 = maketform('affine',[1, 0, 0; 1.5, 1, 0; 0, 0, 1]);
transS1= imtransform(B, S1);
figure()
imshow(transS1);

%Shear 2 | x = 2
S2 = maketform('affine',[1, 2, 0; 0, 1, 0; 0, 0, 1]);
transS2= imtransform(B, S2);
figure()
imshow(transS2);
