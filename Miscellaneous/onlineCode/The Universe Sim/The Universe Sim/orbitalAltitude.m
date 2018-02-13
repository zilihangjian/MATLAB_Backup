%finds the orbital alt for each planet using roches theroem 



function [alt] = orbitalAltitude(sunr,amt,sunm,prad,pmass,pAlts)

%no alt if no planets
if amt == 0
    alt = 0;
else
    %initilizes an array for altitudes
    alt = zeros(amt,1);
    
    svolume = (4/3) * pi * (sunr)^3; % calculates various values to determine minimum altitude
    
    sdensity = sunm/svolume; 
    
    pvolume = (4/3) * pi * (prad)^3;
    
    pdensity = pmass/pvolume;
    
    x = 1.26*sunr*(sdensity/pdensity)^(1/3); %calculates minimum altitude for a planet based on physics
    x = round(x); 
    %for i = 1:amt
    spaceFound =0;
    while spaceFound < size(pAlts,1) % checks to ensure that there are no other planets within a certain distance of the planet
        alt = randi([x+7e8,60e8+x]);
        for i = 1:size(pAlts,1)
            if pAlts(i) - alt<0
                if pAlts(i) - alt > -3e8
                    spaceFound = 0;
                else
                    spaceFound = spaceFound+1;
                end
            elseif pAlts(i) - alt>0
                if pAlts(i)-alt < 3e8
                    spaceFound = 0;
                else
                    spaceFound = spaceFound+1;
                end
            end
                
        end
        if spaceFound < size(pAlts,1)
            spaceFound = 0;
        end
        
    end
    
end
end


