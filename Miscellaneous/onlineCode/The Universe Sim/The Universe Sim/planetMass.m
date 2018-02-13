function [mass] = planetMass(type,radius)

radius = radius * 1000;%switches radius to m
V = (4/3)*pi*(radius^3);%olume
p = randi([1,10]);%random variable
d = 0;%density

if type == 'gass'
    if p <= 1
        d = randi([1,650]);
    elseif p >1 && p < 10
        d = randi([650,1200]);
    elseif p == 10;
        d = randi([1200,1500]);
    end
end
if type == 'rock'
    if p == 1
        d = randi([3000,4000]);
    elseif p >1 && p <10
        d = randi([4000,10000]);
    elseif p == 10;
        d = randi([10000,80000]);
    end 
end
mass = d * V;
end