%randomly decides if a planet has an atmosphere


function [out] = pAtmosphere(type)
if type == 'gass'
    out = 5;
else
        out = randi([0,5]);
end
end