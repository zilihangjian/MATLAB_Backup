clc; clear; close all;
%Part 4 Power Law Transformation: s = c*r(i,j)^gamma
spine = imread('fracture spine.tif');
figure(1); imshow(spine); title('Original');xlabel('x'); ylabel('y');
f = im2double(spine);
[m,n] = size(f);
c = 1;
gam = [.6 .4 .3];
for i=1:m
    for j=1:n
        plt1(i,j) = c*(f(i,j)^gam(1,1));
        plt2(i,j) = c*(f(i,j)^gam(1,2));
        plt3(i,j) = c*(f(i,j)^gam(1,3));
    end 
end
figure(2); imshow(plt1); title('gamma: .6');xlabel('x'); ylabel('y');
figure(3); imshow(plt2); title('gamma: .4');xlabel('x'); ylabel('y');
figure(4); imshow(plt3); title('gamma: .3');xlabel('x'); ylabel('y');
