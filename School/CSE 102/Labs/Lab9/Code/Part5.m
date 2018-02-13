van = imread('van_original.tif');
figure(1); imshow(van); title('Original');
hsobel = fspecial('sobel');
vsobel = hsobel';

h_van = imfilter(van,hsobel);
v_van = imfilter(van,vsobel);

figure(2); imshow(h_van); title('Horizontal Edge');
figure(3); imshow(v_van); title('Vertical Edge');