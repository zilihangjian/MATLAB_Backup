function [thesign] = getSign(value)

if value > 0
    thesign = 1;
elseif value == 0 
    thesign = 0;
else 
    thesign = -1;
end


end

