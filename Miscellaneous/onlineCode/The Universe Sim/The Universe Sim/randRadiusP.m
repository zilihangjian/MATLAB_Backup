%Gets radius in km for plantets randomly based on tyoe



function [radius] = randRadiusP(type)

%radius for a rocky planet
if type == 'rock'
    p = randi(8,1);
    if p == 1
        radius = randi([2000, 6000]);
    elseif p >= 2 || p <= 8
        radius = randi([10000, 100000]);
    end

%radius for a gas giant
else
    radius = randi([10000,140000]);
end
