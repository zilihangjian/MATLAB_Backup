%makes a matrix of color values for each star



function [color] = sunColor(t,type)

%black holes are all black
if type == 'black'
   color = [0,0,0];
end   

%the hotter a sun is the brighter the color

%red giants are red and blue giants are blue
if type == 'giant'
    if t > 4500  
        color = [200+((t-20000)*(50/30000)),255,200+((t-20000)*(50/30000))];
    else
        color = [255,(t-3500)*(15/100),0];
    end
end 

%whitwe dwarfs are white and blue dwarfs are blue
if type == 'dwarf'
    if t >= 100000
        color = [255,255,255];
    else
        color = [255,(t-3000)*(15/100),0];
    end
end
  
%ranges in colors from white the red based on temp
if type == 'norml'
    if t < 6000
        color = [255,(t-3000)*(255/3000),0];
    elseif t >= 6000 && t < 10000
       color = [255,255,(t-6000)*(255/4000)];
    else
        color = [255-(t-10000)*(150/40000),255-(t-10000)*(150/40000),255];
    end
end   
end


