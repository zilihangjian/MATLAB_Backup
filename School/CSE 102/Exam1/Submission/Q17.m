noise = imread('noise.png');
noise = rgb2gray(noise);
noise = im2double(noise);
figure(1); imshow(noise);
filter = fspecial('disk',5);
filtered_noise = imfilter(noise,filter);
figure(2); imshow(filtered_noise);


