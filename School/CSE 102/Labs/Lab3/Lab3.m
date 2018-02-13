clc;
%Part1
A = imread('Cameraman.bmp');
imwrite(A,'CMan.jpg','jpg');
imwrite(A,'Cman1.png','png');
figure(1);
imshow('CMan.jpg');
figure(2);
imshow('CMan1.png');
figure(3);
imshow('Cameraman.bmp');

%Image Size
B = imread('CMan.jpg');
C = imread('CMan1.png');
[x1,y1,z1] = size(A);
[x2,y2,z2] = size(B);
[x3,y3,z3] = size(C);

%Part2
D = imread('Miami.jpg');
info = imfinfo('Miami.jpg');
disp(info);
[x4,y4,z4] = size(D);

%Part3
miamiGray = rgb2gray(D);
imshow(miamiGray);
imwrite(miamiGray,'miamiGray.jpg','jpg');
[x5,y5,z5] = size(miamiGray);
imfinfo('miamiGray.jpg');

%Part 4



%Part 5
E = imread('buffalo.jpeg');
buffaloscale = E*2;
buffalocomplement = imcomplement(E);
figure(4);
imshow(E);
figure(5);
imshow(buffaloscale);
figure(6);
imshow(buffalocomplement);

%Part 6
F = imread('Wombat.jpeg');
wombatdivision = F/64;
wombatscale = wombatdivision/64;
figure(7);
imshow(F);
figure(8);
imshow(wombatdivision);
figure(9);
imshow(wombatscale);

%Part 7
G = imread('Cameraman.bmp');
[x,map]=gray2ind(G);

figure(10);
imshow(x);
histimage = histeq(x);
figure(11);
imshow(histimage);

%Part 8
H = imread('chickens.bmp');
J = imread('sunrise.bmp');
figure(12);
histogram(H);
figure(13);
histogram(J);

K = rgb2gray(H);
L = histeq(K);
figure(14);
imshow(L);
M = rgb2gray(J);
N = histeq(M);
figure(15);
imshow(N);


%Part 9
sr1 = imresize(A,1/2);
figure(16);
imshow(sr1);
sr2 = imresize(sr1,1/2);
figure(17);
imshow(sr2);
sr3 = imresize(sr2,1/2);
figure(18);
imshow(sr3);
sr4 = imresize(sr3,1/2);
figure(19);
imshow(sr4);



