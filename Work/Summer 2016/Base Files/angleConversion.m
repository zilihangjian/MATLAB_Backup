theta = ones(1, length(AZdeg));
for i =1: length(AZdeg)
    angle = AZdeg(i);
    if angle >= 90 && angle <= 270 
        theta(i) = 90 - angle;
    end
end