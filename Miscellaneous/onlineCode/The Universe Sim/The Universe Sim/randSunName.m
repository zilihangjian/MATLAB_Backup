%Picks a randon sun name for a given sun type



function [name] = randSunName(type)

%Reads file

[namelist] = readFile('namelist.txt');

%chooses name based on sun type

if type == 'black';
    name = ['Black-' namelist(randi(size(namelist,1)),:)];
end

if type == 'giant'
    name = ['Giant-' namelist(randi(size(namelist,1)),:)];
end
    
if type == 'dwarf'
    name = ['Dwarf-' namelist(randi(size(namelist,1)),:)];
end
    
if type == 'norml'
    name = namelist(randi(size(namelist,1)),:);
end
end
    