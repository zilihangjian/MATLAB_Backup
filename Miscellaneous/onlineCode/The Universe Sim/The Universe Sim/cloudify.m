%draws clouds on planets with an atmosphere



function s = cloudify (inImg,atmosphere)
dim = size(inImg);
s = zeros([dim(1),dim(2)]);     % Prepare output image (size: m x m)
w = 20;
i = 0;
while w > 3
    i = i + 1;
    d = interp2(randn([dim(1),dim(2)]), i-1, 'spline'); % generates a randomized perlin noise map
    s = s + i * d(1:dim(1), 1:dim(2));
    w = w - ceil(w/2 - 1);
end
s = (s - min(min(s(:,:)))) ./ (max(max(s(:,:))) - min(min(s(:,:))));
s = cat(3,s,s,s); % makes the matrix a 3d matrix so it can be applied to color images
s = s/1.5;
atmosphere = atmosphere/7;
for i = 1:dim(1)
    for j = 1:dim(2)
        if s(i,j) > .75-atmosphere;
            inImg(i,j,:) = inImg(i,j,:) + .7*s(i,j,:); %adds a certain number of clouds based on density of atmosphere
        end
    end
end
s = inImg;
end