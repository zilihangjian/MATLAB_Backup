%randomly chooses a type of sun



function type = randType()

%Simulates a random percentage choice
p = randi(100,1);

% 5% chanve of being a black hole
if p <= 5
    type = 'black';
end

%10% chance of being a giant
if p > 5 && p <= 15
    type = 'giant';
end

%10 % chance of being a dwarf
if p > 15 && p <= 25
    type = 'dwarf';
end

%75~% chance of getting a normal star
if p > 25
    type = 'norml';
end
end
    

