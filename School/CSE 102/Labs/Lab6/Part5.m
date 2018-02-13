%Part 6
clc; clear; close all;
hubble = imread('hubble.tif');
figure();imshow(hubble);title('Original');
avgF = fspecial('average',[15,15]);
hubFilter = imfilter(hubble,avgF,'replicate');
figure();imshow(hubFilter);title('Filtered');

[height, width]=size(hubFilter);
storage = zeros(height,width,'uint8');  

for i=1:height 
    for j=1:width
        value = hubFilter(i,j);
        if value <= 120                                
            storage(i,j)=0;
        else                                        
            storage(i,j)=255;
        end
    end
end
figure();imshow(storage);title('Thresholded');