function out = planetWater(type,atm)

out = 0 ;%%initial makes the output 0

if type == 'rock' 
    if atm>0
    out = 1;%10% chance of making a rocky planet have water
    end
end
end
