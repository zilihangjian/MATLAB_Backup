function [] = generateProtein(N,mode)
%function [] = generateProtein(N,mode)
%Inputs: N: Length of protein chain in terms of amino acids, mode- an integer 
%that corresponds to the type of protein created, 1 for straight chain or 2
%for a random walk generated protein

close all; clc;
%Boltzmann Factor
temperature = 10;
kB = 1.38064852e-23;
protein = round(19.*rand(1,N + 1) + 1);
protein_overlap = true;
new_position = [0 0];
current_position = [0,0];
amino_acid = py.tuple({});
x_position = [0];
y_position = [0];
h = figure();
hold on;
h.Name = 'Protein Simulation';
h.MenuBar = 'none';
h.Color = 'black';
plot(x_position(1),y_position(1),'ksquare');
zoom on; 
if mode == 1
    straight_direction = rand(1,1)*4;
    for t = 1: N + 1
        new_position = determinePosition(new_position,straight_direction,...
            current_position);
        amino_acid = amino_acid + ({current_position(1),current_position(1)...
            new_position(1), new_position(2)});
        x_position = [x_position new_position(1)];
        y_position = [y_position new_position(2)];
        previous_position = current_position;
        current_position = new_position;
        plot(x_position(t+1),y_position(t+1),'wsquare'); axis off;
        current_color = determineColor(protein(t));
        plot([x_position(t) x_position(t+1)],[y_position(t) y_position(t+1)],...
            'Color',current_color);
        drawnow; pause(1/5);
        protein_overlap = true;
    end
end
if mode == 2
    for t = 1: N +1
        random_direction = rand(1,1)*4;
        while protein_overlap && t ~= 1
            new_position = determinePosition(new_position,random_direction,current_position);
            for i=1:length(x_position)
                if new_position == [x_position(i) y_position(i)];
                    random_direction = round(rand(1,1)*4);
                    break
                end
                
                determineDeadlock(new_position,x_position,y_position);
                
                if i == length(x_position)
                    protein_overlap = false;
                end
            end
        end
        previous_direction = random_direction;
        x_position = [x_position new_position(1)];
        y_position = [y_position new_position(2)];
        previous_position = current_position;
        current_position = new_position;
        plot(x_position(t+1),y_position(t+1),'wsquare'); axis off;
        current_color = determineColor(protein(t));
        plot([x_position(t) x_position(t+1)],[y_position(t) y_position(t+1)],...
            'Color',current_color);
        drawnow; pause(1/5);
        protein_overlap = true;
    end
end
keyboard
end

function [] = determineDeadlock()
     if any(((new_position(1)+1) == x_position))
            
     end

end

function [new_position] = determinePosition(new_position,...
    random_direction,current_position)
    if random_direction < 1
        new_position = current_position + [1 0];
    elseif random_direction < 2
        new_position = current_position + [0 1];
    elseif random_direction < 3
        new_position = current_position + [-1 0];
    elseif random_direction < 4
        new_position = current_position + [0 -1];
    end
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

function [] = determineFolding()

end