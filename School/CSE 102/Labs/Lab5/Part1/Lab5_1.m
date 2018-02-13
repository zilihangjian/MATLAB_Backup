clc; clear;
%Part 1
college = imread('college.jpg');
figure(1); imshow(college);xlabel('x');ylabel('y'); title('Original');
info = imfinfo('college.jpg','jpg');%Displays Information about college.jpg
disp(info);
grayScaleCollege = rgb2gray(college);
figure(2); imshow(grayScaleCollege);xlabel('x');ylabel('y'); ...
    title('Gray Scale');

level = graythresh(grayScaleCollege);
binaryCollege = im2bw(college,level);
figure(3); imshow(binaryCollege);xlabel('x');ylabel('y'); ...
    title('Binary');
whos;%displays the size of all three for comparison