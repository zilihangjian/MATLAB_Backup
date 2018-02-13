

% determines a random number of moons for a planet to have

function out = numMoons()
q = randi([1,3]);
if q == 3
    out = randi([5,20]);
else
    out = randi([0,5]);
end
end