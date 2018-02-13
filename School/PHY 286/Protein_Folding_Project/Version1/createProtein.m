function [] = createProtein(N,mode)
%function [] = createProtein(N,mode)
%Inputs: N: Length of protein chain in terms of amino acids, mode- an integer 
%that corresponds to the type of protein created, 1 for straight chain or 2
%for a random walk generated protein

close all; clc;
%Variable Declaration

%Boltzmann Factor
rng('shuffle');

protein = round(19.*rand(1,N+1) + 1);
%creates a vector to store the colors for each amino acid created
amino_check = true;
%boolean value to check if the amino acids are overlapping 
new_position = [0 0];
%vector to hold the new position after determining the next movement 
current_position = [0,0];
%vector to hold the current postion before determining the next movement
%tuple that will store the amino acids starting and ending positions, every
%4 indexs will represent a different amino acid
x_position = [0];
y_position = [0];

deadlockIndex = 0;

%Figure Generation
h = figure(); hold on;
h.Name = 'Protein Simulator'; h.MenuBar = 'none'; h.Color = 'black';
zoom on; axis off; 
current_color = determineColor(protein(1));
plot(new_position(1),new_position(2),'Marker','square','Color', ...
    current_color,'MarkerSize',20);
amino_storage = {[x_position(1) y_position(1)]};
%Straight Chain Generation
if mode == 1
    direction = rand(1,1)*4;
    for t = 2: N 
        current_color = determineColor(protein(t));%Determines the color of the amino acid
        new_position = determinePosition(new_position,direction,...
            current_position);
        plot(new_position(1),new_position(2),'Marker','square','Color', ...
            current_color,'MarkerSize',20);
        x_position = [x_position new_position(1)];
        y_position = [y_position new_position(2)];
        amino_storage(t) = {[x_position(t), y_position(t)]};
        plot([x_position(t-1) x_position(t)],[y_position(t-1) y_position(t)],'w');
        drawnow; pause(1/5);
        current_position = new_position;
    end
end

%Random Self Avoiding Walk
if mode == 2
    protein_overlap = false; %Boolean value for checking if the amino acids overlap
    protein_deadlock = false;
    for t = 2: N %Iterates through the whole loop of amino acids
        random_direction = rand(1,1)*4; %Initlal random direction associated with the random walk
        while ~protein_overlap && t ~= 1
            new_position = determinePosition(new_position,random_direction,current_position);
            for i=1:length(x_position)
                if new_position == [x_position(i) y_position(i)];
                    random_direction = rand(1,1)*4;
                    break
                end
                protein_deadlock = checkDeadlock(amino_storage,protein_deadlock, new_position);
                if protein_deadlock
                    break
                end
                if i == length(x_position)
                    protein_overlap = true;
                end
            end
        end
        x_position = [x_position new_position(1)];
        y_position = [y_position new_position(2)];
        
        current_color = determineColor(protein(t));
        plot(new_position(1),new_position(2),'Marker','square','Color', ...
            current_color,'MarkerSize',20);
        amino_storage(t) = {[x_position(t), y_position(t)]};
       
        plot([x_position(t-1) x_position(t)],[y_position(t-1) y_position(t)],'w');
        drawnow; pause(1/5);
        current_position = new_position;
        protein_overlap = false;
        protein_deadlock = false;
    end
end

initialEnergy = determineStructureEnergy(amino_storage);

end

function [protein_deadlock] = checkDeadlock(amino_storage,protein_deadlock,new_position)

right = [1 0]; left = [-1 0]; up = [0 1]; down = [0 -1];
directions = {right, left, up, down}; %Checks areas around amino acids
deadlockCount = 0;
for j=1:length(directions)
    check = amino_storage{end} + new_position + directions{j};
    for i = 1: length(amino_storage)
        if isequal(check , amino_storage{i});
            deadlockCount = deadlockCount + 1;
        end
    end
end

if deadlockCount > 3
    protein_deadlock = true;
else 
    protein_deadlock = false;
end
    
end

function [new_position] = determinePosition(new_position,...
    direction,current_position)
%function [new_position] = determinePosition(new_position,...
%    direction,current_position)
    if direction < 1
        new_position = current_position + [1 0];
    elseif direction < 2
        new_position = current_position + [0 1];
    elseif direction < 3
        new_position = current_position + [-1 0];
    elseif direction < 4
        new_position = current_position + [0 -1];
    end
end



function [] = determineFolding(amino_storage)
%Boltzmann Factor
temperature = 10;
kB = 1.38064852e-23;
end

function [] = monteCarloMethod(amino_storage)

end

function [color] = determineColor(aa)
if aa == 1
    color = [1 1 0];%yellow
elseif aa == 2
    color = [1 0 1];%magenta
elseif aa == 3
    color = [0 1 1];%cyan
elseif aa == 4
    color = [1 0 0];%red
elseif aa == 5
    color = [0 1 0];%green
elseif aa == 6
    color = [0 0 1];%blue
elseif aa == 7
    color = [255 192 203] ./255;%pink
elseif aa == 8
    color = [18 150 155] ./ 255;%teal
elseif aa == 9
    color = [94 250 81] ./ 255;%lightgreen
elseif aa == 10
    color = [8 180 238] ./ 255;%lightblue
elseif aa == 11
    color = [1 17 181] ./ 255;%darkblue
elseif aa == 12
    color = [251 111 66] ./ 255;%peach
elseif aa == 13
    color = [240 255 250] ./ 255;%azure
elseif aa == 14
   color  = [230 230 250] ./ 255;%lavender
elseif aa == 15
   color = [240 128 128] ./ 255;%light coral
elseif aa == 16
   color = [0 100 0] ./ 255;%dark green
elseif aa == 17
   color = [50 205 50] ./255;%lime green
elseif aa == 18
   color = [139 69 19] ./ 255;%brown
elseif aa == 19
   color = [250 128 114] ./255;%salmon
elseif aa == 20
   color = [153 50 204] ./ 255;%dark orchid
end
end

