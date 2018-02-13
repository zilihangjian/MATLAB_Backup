%Part 4? Devise a 3x3 mask for an identity filter, causes no change
imask = ones(3,3);

Cameraman = imread('Cameraman.bmp');
dou = im2double(Cameraman);
iCameraman = filter2(imask,dou);
figure(1);
imshow(dou);
figure(3);
imshow(Cameraman);
figure(2);
imshow(iCameraman);

%Part 6 
close all;
Large = imread('Aquamarine Large.jpg');
H = fspecial('average',3);
average = imfilter(Large,H,'replicate');
figure(4);
imshow(average);
figure(5)
imshow(Large);


H1 = fspecial('average',5);
average1 = imfilter(Large,H1,'replicate');
figure(6);
imshow(average1);

H2 = fspecial('average',7);
average2 = imfilter(Large,H2,'replicate');
figure(7);
imshow(average2);

H3 = fspecial('average',9);
average3 = imfilter(Large,H3,'replicate');
figure(8);
imshow(average3);

H4 = fspecial('average',20);
average4 = imfilter(Large,H4,'replicate');
figure(9);
imshow(average4);

%Part 7
close all;
H5 = fspecial('gaussian',3,.5);
H6 = fspecial('gaussian',3,1);
H7 = fspecial('gaussian',3,2);
average5 = imfilter(Large,H5,'replicate');
figure(10);
imshow(average5);
average6 = imfilter(Large,H6,'replicate');
figure(11);
imshow(average6);
average7 = imfilter(Large,H7,'replicate');
figure(12);
imshow(average7);

H8 = fspecial('gaussian',7,1);
H9 = fspecial('gaussian',7,3);
H10 = fspecial('gaussian',7,6);
average8 = imfilter(Large,H8,'replicate');
figure(13);
imshow(average8);
average9 = imfilter(Large,H9,'replicate');
figure(14);
imshow(average9);
average10 = imfilter(Large,H10,'replicate');
figure(15);
imshow(average10);

H11 = fspecial('gaussian',11,1);
H12 = fspecial('gaussian',11,4);
H13 = fspecial('gaussian',11,8);
average11 = imfilter(Large,H11,'replicate');
figure(16);
imshow(average11);
average12 = imfilter(Large,H12,'replicate');
figure(17);
imshow(average12);
average13 = imfilter(Large,H13,'replicate');
figure(18);
imshow(average13);

H14 = fspecial('gaussian',21,1);
H15 = fspecial('gaussian',21,5);
H16 = fspecial('gaussian',21,10);
average14 = imfilter(Large,H14,'replicate');
figure(19);
imshow(average14);
average15 = imfilter(Large,H15,'replicate');
figure(20);
imshow(average15);
average16 = imfilter(Large,H16,'replicate');
figure(21);
imshow(average16);

%Part 9
%disk
close all;
disk1 = fspecial('disk',5);
disk2 = fspecial('disk',1);
disk3 = fspecial('disk',10);

dcam1 = imfilter(Cameraman,disk1,'replicate');
dcam2 = imfilter(Cameraman,disk2,'replicate');
dcam3 = imfilter(Cameraman,disk3,'replicate');
figure(22);
imshow(dcam1);
figure(23);
imshow(dcam2);
figure(24);
imshow(dcam3);

%Prewitt
prew = fspecial('prewitt');
precam = imfilter(Cameraman,prew,'replicate');
figure(25);
imshow(Cameraman);
figure(26);
imshow(precam);

%Sobel
sobe = fspecial('sobel');
sobecam = imfilter(Cameraman,sobe,'replicate');
figure(27);
imshow(sobecam);

close all;
%Laplacian Filter
for n=1:10
    lapla = fspecial('laplacian',.01*n);
    lapcam = imfilter(Large,lapla,'replicate');
    figure(27+n);
    imshow(lapcam);
end






