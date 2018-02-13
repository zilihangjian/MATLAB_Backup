w = imread('caribou.jpg');
for i=1:255
    for j=1:255
        if (w(i,j) < 175)
            w(i,j) = 0;
        
        end
    end
    
end

imshow(w);