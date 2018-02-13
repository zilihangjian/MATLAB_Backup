%solves the albedo of a planet



function albedo = planAlbedo (inImg)

%flattens image to make it B&W
flatImg = (inImg(:,:,1)+inImg(:,:,2)+inImg(:,:,3))./3;
%find dimensions of image
dim = size(flatImg);
currentSum = 0;

%sums the values for each pixel to find its brightness or reflectivity
for i = 1:dim(1)
    for j = 1:dim(2)
        currentSum = currentSum + flatImg(i,j);
    end
end
%solves for albedo from that average value
albedo = (currentSum/numel(flatImg))*.7;
end