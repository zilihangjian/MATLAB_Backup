%Fills in colors on planets



function outImg = contCol(inImg,life)
outImg = zeros(100,200,3);
if life == 1 % defines colors for life filled planets by using a heightmap
    for i = 1:100
        for j = 1:200
            if inImg(i,j) > 11
                outImg(i,j,:) = 240;
            elseif inImg(i,j) == 10
                outImg(i,j,:) = 220;
            elseif inImg(i,j) == 9
                outImg(i,j,:) = [200,200,200];
            elseif inImg(i,j) == 8
                outImg(i,j,:) = [180,190,180];
            elseif inImg(i,j) == 7
                outImg(i,j,:) = [150,190,150];
            elseif inImg(i,j) == 6
                outImg(i,j,:) = [140,190,140];
            elseif inImg(i,j) == 5
                outImg(i,j,:) = [120,170,120];
            elseif inImg(i,j) == 4
                outImg(i,j,:) = [100,160,100];
            elseif inImg(i,j) == 3
                outImg(i,j,:) = [80,150,80];
            elseif inImg(i,j) == 2
                outImg(i,j,:) = [130,140,100];
            elseif inImg(i,j) == 1
                outImg(i,j,:) = [170,180,120];
            elseif inImg(i,j) ~= 0
                outImg(i,j,:) = 220;
            end
        end  
    end
else % defines colors for lifeless planets by using a heightmap
    for i = 1:100
        for j = 1:200
            if inImg(i,j) > 11
                outImg(i,j,:) = 240;
            elseif inImg(i,j) == 10
                outImg(i,j,:) = 220;
            elseif inImg(i,j) == 9
                outImg(i,j,:) = [200,200,200];
            elseif inImg(i,j) == 8
                outImg(i,j,:) = [180,160,180];
            elseif inImg(i,j) == 7
                outImg(i,j,:) = [150,140,150];
            elseif inImg(i,j) == 6
                outImg(i,j,:) = [140,120,120];
            elseif inImg(i,j) == 5
                outImg(i,j,:) = [120,105,110];
            elseif inImg(i,j) == 4
                outImg(i,j,:) = [100,90,100];
            elseif inImg(i,j) == 3
                outImg(i,j,:) = [80,80,80];
            elseif inImg(i,j) == 2
                outImg(i,j,:) = [100,90,80];
            elseif inImg(i,j) == 1
                outImg(i,j,:) = [130,110,90];
            elseif inImg(i,j) ~= 0
                outImg(i,j,:) = 220;
            end
        end  
    end
end
outImg = outImg./255;