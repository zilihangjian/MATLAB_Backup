%Gets radius in km for stars randomly based on type


function [radius] = randRadius(type)

%randoly either a massive or tiny black hole
if type == 'black'
    p = randi(10,1);
    if p == 1
        radius = randi([4, 48])*250000;
    elseif p >= 2 || p <= 6
        radius = randi([10, 100]);
    elseif p > 6
        radius = randi([1,10000])*100;
    end
end   

%randomlty chooses size for giant suns
if type == 'giant'
    p = randi(10,1);
    if p == 1
        radius = randi([9,10])*100000000;
    elseif p >= 2
        radius = randi([100,400])*1000000;
    end
end  

%randomly chooses smaller size for dwarf stars
if type == 'dwarf'
        radius = randi([1000,100000]);
end
  
%randomly chooses size for regular suns
if type == 'norml'
    p = randi(20,1);
    if p == 1
        radius = randi([3000, 5000])*100;
    elseif p >= 2 || p <= 9
        radius = randi([5000, 20000])*100;
    elseif p > 9
        radius = randi([2,100])*1000000;
    end
end   
end