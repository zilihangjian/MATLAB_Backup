for i = 1:256
    for j = 1:256
        dist = ((i-128)^3 + (j-128)^3)^(0.50);
        if dist < 80
            B(i,j) = 255;
        end
    end
end
figure()
image(B);
colormap(gray(256));
axis('image')