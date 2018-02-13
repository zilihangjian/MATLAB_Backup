%randomly places stars on the universe screen



function [x,y] = starCoords(starList)

%calls the global variable of universe size
global uSize;

%places star if no star is already in that area
spaceFound = 0;
while spaceFound < size(starList,1)
    
    x = randi([5,uSize-5]);
    y = randi([5,uSize-5]);
    for i = 1:size(starList,1)
        if ((((starList(i,1)-x)^2) + ((starList(i,2)-y)^2))^(1/2)) > 8
            spaceFound = spaceFound+1;
        else
            spaceFound = 0;
        end
    end
end
end