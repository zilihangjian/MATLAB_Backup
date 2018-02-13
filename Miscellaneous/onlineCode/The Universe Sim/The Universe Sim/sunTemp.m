%randomly decides Temerature in Kelvin based on type of sun



function [t] = sunTemp(type)

%chooses alow temp for black holes
if type == 'black'
    t = randi([7,10]);
end   

%very hot for 20% of the time(blue giants) and the rest of the time it is
%cooler (red giants)
if type == 'giant'
    p = randi([1,5]);
    if p == 1
        t = randi([20000,50000]);%Blue giants
    else
        t = randi([3500,4500]);%Red giants
    end
end 

%10% chhance for a cooler white dwarf and 90% chance for a hotter red dwarf
if type == 'dwarf'
    p = randi([1,10]);
    if p == 1
        t = randi([1000,2000])*100;%white dwarf
    else
        t = randi([3000,4000]);%red dwarf
    end
end
  
%chooses temp for regular suns
if type == 'norml'
    p = randi([1,4]);
    if p == 1
        t = randi([3000,8000]);
    else
        t = randi([8000,50000]);
    end
end   
end
