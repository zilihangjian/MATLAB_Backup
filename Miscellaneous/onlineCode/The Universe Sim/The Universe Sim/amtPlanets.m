%Generate a random number of planets for a system to have

function amt = amtPlanets()

%randomly chooses a number to decide
p = randi([1,100]);
% 70% chance for 1-3 planets
if p <=70
    amt = randi([1,3]);
end
if p >70 && p<100
% ~30% chance for 4-9
    amt = randi([4,9]);
end
%one percent chance for a massive system to spawn
if p == 100
    amt = randi([10,20]);
end