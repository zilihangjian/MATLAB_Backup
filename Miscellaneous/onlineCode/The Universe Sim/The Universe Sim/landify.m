%draws landmasses on a planet



function outImg = landify(inImg,water,baseC,life)

%for plates with water
if water == 1
    
    %draws a shape using makeContinent
    contMap = makeContinent(life);
    %contMap = cat(3,contMap,contMap,contMap);
    
    %loops through planet texture and places different values for where
    %land will be
    for i = 1:100
        for j = 1:200
            for k = 1:3
                if(contMap(i,j,k) ~= 0)
                    inImg(i,j,k) = contMap(i,j,k);
                end
            end
        end
    end
    
    %draws craters on just rocky planets
else
    for i = 1:randi([40,70])
        colorMod = (baseC + [randi([-20,5]),randi([-20,5]),randi([-20,5])])/255;
        craterX = randi([5,90]);
        craterY = randi([5,90]);
        craterR = randi([1,3]);
        inImg = insertShape(inImg, 'circle', [craterX craterY craterR],'color',colorMod);
    end
end
outImg = inImg;
end