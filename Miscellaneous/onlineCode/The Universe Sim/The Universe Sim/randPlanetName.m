%Picks a randon sun name for a given sun type


function [name] = randPlanetName()

%Reads file

[namelist] = readFile('namelist.txt');

%chooses a random name from file
name = namelist(randi(size(namelist,1)),:);
end
