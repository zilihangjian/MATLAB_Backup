%chooses the type of planet(50/50 gas or rock)



function type = randTypeP()

%50 50 chance of assigning each type
p = randi([1,2]);
if p ==1
    type = 'rock';
end
if p ==2
    type = 'gass';
end

