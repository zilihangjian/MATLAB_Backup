%draws continents for water planets with life


function outImg =  makeContinent(life)

s = 100;
p = randi([1,30]);
if p == 1
    numCont = 0;
else
    numCont = randi([10,30]);
end
c = zeros(s,s*2,numCont);
dimensions = size(c);
for l = 1:numCont
    
    x = randi([25,75]);
    y = randi([25,175]);
    c(x,y,l) = randi([8,15]);
    
    for k = 1:2
        %loops through each point and checks if it is white, if it is it it checks
        %the points around them and sees if thier within the difference range of
        %the original point, if they are they become white as well
        for i = 2:dimensions(1)-1
            for j = 2:dimensions(2)-1
                if c(i,j,l) ~= 0 && c(i-1,j,l) == 0 && c(i-1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i-1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i-1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i-1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i+1,j,l) == 0 && c(i+1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i+1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i+1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i+1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j-1,l) == 0 && c(i,j-1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j-1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j-1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j-1,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j+1,l) == 0 && c(i,j+1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j+1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j+1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j+1,l) = c(i,j,l)-1;
                    end
                end
            end
        end
        
        for i = dimensions(1)-1:-1:2
            for j = 2:dimensions(2)-1
                if c(i,j,l) ~= 0 && c(i-1,j,l) == 0 && c(i-1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i-1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i-1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i-1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i+1,j,l) == 0 && c(i+1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i+1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i+1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i+1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j-1,l) == 0 && c(i,j-1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j-1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j-1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j-1,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j+1,l) == 0 && c(i,j+1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j+1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j+1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j+1,l) = c(i,j,l)-1;
                    end
                end
            end
        end
        
        for i = 2:dimensions(1)-1
            for j = dimensions(2)-1:-1:2
                if c(i,j,l) ~= 0 && c(i-1,j,l) == 0 && c(i-1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i-1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i-1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i-1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i+1,j,l) == 0 && c(i+1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i+1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i+1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i+1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j-1,l) == 0 && c(i,j-1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j-1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j-1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j-1,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j+1,l) == 0 && c(i,j+1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j+1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j+1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j+1,l) = c(i,j,l)-1;
                    end
                end
            end
        end
        
        for i = dimensions(1)-1:-1:2
            for j = dimensions(2)-1:-1:2
                if c(i,j,l) ~= 0 && c(i-1,j,l) == 0 && c(i-1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i-1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i-1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i-1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i+1,j,l) == 0 && c(i+1,j,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i+1,j,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i+1,j,l) = c(i,j,l);
                    elseif p >2
                        c(i+1,j,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j-1,l) == 0 && c(i,j-1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j-1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j-1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j-1,l) = c(i,j,l)-1;
                    end
                end
                if c(i,j,l) ~= 0 && c(i,j+1,l) == 0 && c(i,j+1,l) == 0
                    p = randi([1,5]);
                    if p ==1
                        c(i,j+1,l) = c(i,j,l)-1;
                    elseif p ==2
                        c(i,j+1,l) = c(i,j,l);
                    elseif p >2
                        c(i,j+1,l) = c(i,j,l)-1;
                    end
                end
            end
        end
    end
end
%c = c/13;
outImg = zeros(100,200);
for i = 1:100
    for k = 1:200
        outImg(i,k) = sum(c(i,k,:));
    end
end
se = strel('disk',4,0); % creates a structural element
outImg = imclose(outImg,se); % smooths the image with the structural element
outImg = contCol(outImg,life);
%imagesc(outImg);

end


