pic = imread('502639.jpg');

figure(2);
imshow(pic);
for i=1:2385
    for j=1:3888
        if pic(i,j,1) > 250 
            pic(i,j,1) = 0;
        end
    end
end

figure(1);
imshow(pic);


