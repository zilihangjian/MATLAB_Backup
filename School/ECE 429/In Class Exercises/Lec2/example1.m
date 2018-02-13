for i = 1:256
    for j = 1:256
        A(i,j) = j-1;
    end
end
image(A);
colormap(gray(256));
