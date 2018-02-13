function [] = createProtein(N,mode,mcSteps,temperature)
%function [] = createProtein(N,mode)
%Inputs: N: Length of protein chain in terms of amino acids, mode- an integer
%that corresponds to the type of protein created, 1 for straight chain or 2
%for a random walk generated protein, mcSteps- the number of Monte Carlo
%steps to take, temperature- the temperature of the solution that the
%protein is folded in
%Description: This protein folding simulation takes the initial inputs and
%generates an initial protein structure based on the 2D lattice model.
%Then, it animates the protein, and attempts to fold the protein using the
%stochastic Monte Carlo Method. After folding, the output is a newly folded
%protein animation and then a plot showing the fluctuations of energy
%compared to the number of Monte Carlo steps

close all; clc;
rng('shuffle');
%Variable Declaration
protein = round(19.*rand(1,N) + 1); %creates a vector to store the colors for each amino acid created
new_position = [0 0];%vector to hold the new position after determining the next movement
current_position = [0,0];%vector to hold the current postion before determining the next movement
x_position = [0];y_position = [0];%Stores the x and y position of the amino acids
amino_storage = {[x_position(1) y_position(1)]};%Stores an amino as a vector in a cell array

%Figure Generation for Initial Protein
h = figure(); hold on;
h.Name = 'Protein Simulator'; h.MenuBar = 'none'; h.Color = 'black'; zoom on; axis off;
current_color = determineColor(protein(1));
plot(new_position(1),new_position(2),'Marker','square','Color', ...
    current_color,'MarkerSize',20);%First Amino Acid

%Straight Chain Generation
if mode == 1
    direction = rand(1,1)*4;%Picks one direcion to go in to create the initial chain
    for t = 2: N
        current_color = determineColor(protein(t));%Determines the color of the amino acid
        new_position = determinePosition(new_position,direction,...
            current_position);% Determines the amino acid location based off the direction of movement
        plot(new_position(1),new_position(2),'Marker','square','Color', ...
            current_color,'MarkerSize',20);
        
        %Variable Storage
        x_position = [x_position new_position(1)];
        y_position = [y_position new_position(2)];
        amino_storage(t) = {[x_position(t), y_position(t)]};
        plot([x_position(t-1) x_position(t)],[y_position(t-1) y_position(t)],'w');
        drawnow; pause(1/5);%Animation of the protein generation
        current_position = new_position;
    end
end

%Random Self Avoiding Walk
%For the Self Avoiding Walk to function correctly, it cannot overlap itself
%One of the potential problems with this is that it can reach a point of
%deadlock where the code cannot go forward in the current stat
if mode == 2
    protein_overlap = false; %Boolean value for checking if the amino acids overlap
    for t = 2: N %Iterates through the whole loop of amino acids
        random_direction = rand(1,1)*4; %Initlal random direction associated with the random walk
        while ~protein_overlap && t ~= 1
            new_position = determinePosition(new_position,random_direction,current_position);
            for i=1:length(x_position)
                
                if new_position == [x_position(i) y_position(i)] %Checks to see if the new position is already in the amino chain
                    random_direction = rand(1,1)*4;
                    break
                end
                
                protein_deadlock = checkDeadlock(amino_storage, new_position);%Checks for potential deadlock(Non Functional)
                
                if protein_deadlock
                    random_direction = rand(1,1)*4;
                    break
                end
                
                if i == length(x_position)%Reached the end without any problems so that the new position can be plotted
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
        drawnow; pause(1/5);%Animation
        current_position = new_position;
        protein_overlap = false;
    end
end
%Now execute the Monte Carlo Method to fold the protein
monteCarloMethod(amino_storage, mcSteps, protein, temperature, x_position, y_position);
end

function [protein_deadlock] = checkDeadlock(amino_storage,new_position)
%function [protein_deadlock] = checkDeadlock(amino_storage,new_position)
%This function should count the potential movements options after
%recieving a random direction to see if the new direction could potentially
%lead to a deadlock. If the new posistion leads to a potential situation of
%deadlock then a boolean value will indicate that with protein_deadlock
right = [1 0]; left = [-1 0]; up = [0 1]; down = [0 -1];%Checks all movement directions
directions = {right, left, up, down}; %Checks areas around amino acids
deadlockCount = 0;
protein_deadlock = false;
for j=1:length(directions)
    check = amino_storage{end} + new_position + directions{j};
    for i = 1: length(amino_storage)
        if isequal(check , amino_storage{i});
            deadlockCount = deadlockCount + 1;
        end
    end
end
if deadlockCount >= 3
    protein_deadlock = true;
end

end

function [new_position] = determinePosition(new_position,...
    direction,current_position)
%function [new_position] = determinePosition(new_position,...
%    direction,current_position)
%Used for determining the new direction based off a random number from 1 to
%4
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

function [] = animateProtein(amino_storage, protein,x_position,y_position)
%function [] = animateProtein(amino_storage, protein,x_position,y_position)
%Animates a protein based off its 2D dimensions and amino acid combination
h = figure(); hold on;
h.Name = 'Folded Protein'; h.MenuBar = 'none'; h.Color = 'black'; zoom on; axis off;
plot(x_position(1), y_position(1),'Marker','square','Color', ...
    determineColor(protein(1)),'MarkerSize',20);
for i = 2: length(amino_storage)
    current_color = determineColor(protein(i));
    plot(x_position(i),y_position(i),'Marker','square','Color', ...
        current_color,'MarkerSize',20);
    plot([x_position(i-1) x_position(i)],[y_position(i-1) y_position(i)],'w');
    drawnow; pause(1/5);
end
end

function [] = monteCarloMethod(amino_storage, mcSteps, protein,...
    temperature, x_position, y_position)
% function [] = monteCarloMethod(amino_storage, mcSteps, protein,...
%     temperature, proteinEnergy, x_position, y_position)

proteinEnergy = [];%Stores the energy values for each strucutre created to find the changes in energy as the protein folds
aminoEnergy = randomEnergy();%generates the random energy amino to amino interactions
initialEnergy = determineStructureEnergy(amino_storage,aminoEnergy,protein,proteinEnergy,1);%determines the initial energy of the first protein
proteinEnergy(1) = initialEnergy;
kB = 1.38064852E-23;%bolzmann factor
right = [1 0]; left = [-1 0]; up = [0 1]; down = [0 -1];
directions = {right, left, up, down}; %Checks areas around amino acids
newStructure = amino_storage;%temporary structure to determine the new energy of each protein created

for step = 1: mcSteps - 1%Starts the Monte Carlo Method
    energyChange = false;%checks for if there has been an energy change in the structure
    randomAminoAcid = (round((length(newStructure)-1)*rand(1,1)+ 1));%picks a random amino acid in the chain
    %Used for if the random point picked is at the very beginning of the chain
    if randomAminoAcid == 1
        nextAminoAcid = newStructure{randomAminoAcid + 1};
        %Indexes at newStructure{2}, which is the next amino acid in the chain
        %Goes in the four directions surronding the nextAminoAcid
        randomDirection = randperm(length(directions));
        for i=1:length(directions)
            inChain = false;
            newLocation = nextAminoAcid + directions{randomDirection(i)};
            check = checkAminoChain(newLocation, newStructure);
            if check
                inChain = true;%the newLocation is in the amino chain already
            end
            if (sqrt((nextAminoAcid(2) - newLocation(2))^2 +...
                    ((nextAminoAcid(1) - newLocation(1))^2)) == 1 && ~inChain)%Makes sure the distance is the same
                
                currentEnergy = determineStructureEnergy(newStructure,aminoEnergy,protein,proteinEnergy,step);
                if(currentEnergy <= proteinEnergy(step))%Lower energy case
                    proteinEnergy(step+1) = currentEnergy;
                    newStructure(randomAminoAcid) = {[newLocation(1) newLocation(2)]};
                    x_position(randomAminoAcid) = newLocation(1);
                    y_position(randomAminoAcid) = newLocation(2);
                    energyChange = true;
                else
                    if (exp(-currentEnergy /kB*temperature)) > rand%randomness case
                        proteinEnergy(step+1) = currentEnergy;
                        newStructure(randomAminoAcid) = {[newLocation(1) newLocation(2)]};
                        x_position(randomAminoAcid) = newLocation(1);
                        y_position(randomAminoAcid) = newLocation(2);
                        energyChange = true;
                    else
                        proteinEnergy(step+1) = proteinEnergy(step);
                        energyChange = true;
                    end
                end
            end
        end
        
        %Used for if the random point picked is at the very end of the chain
    elseif randomAminoAcid == length(newStructure)
        randomDirection = randperm(length(directions));%randomizes the direction
        previousAminoAcid = newStructure{randomAminoAcid -1};
        for i=1:length(directions)
            inChain = false;
            newLocation = previousAminoAcid + directions{randomDirection(i)};
            check = checkAminoChain(newLocation,newStructure);
            if check
                inChain = true;%newLocation is in the amion acid chain
            end
            if (sqrt((previousAminoAcid(2) - newLocation(2))^2 + ...
                    ((previousAminoAcid(1) - newLocation(1))^2)) == 1 && ~inChain)%ensures that it is the same distance 
                
                currentEnergy = determineStructureEnergy(newStructure,aminoEnergy,protein,proteinEnergy,step);
                
                if(currentEnergy <= proteinEnergy(step))%lower energy case
                    proteinEnergy(step+1) = currentEnergy;
                    newStructure(randomAminoAcid) = {[newLocation(1) newLocation(2)]};
                    x_position(randomAminoAcid) = newLocation(1);
                    y_position(randomAminoAcid) = newLocation(2);
                    energyChange = true;
                else
                    if (exp(-currentEnergy /kB*temperature)) > rand%randomness case
                        proteinEnergy(step+1) = currentEnergy;
                        newStructure(randomAminoAcid) = {[newLocation(1) newLocation(2)]};
                        x_position(randomAminoAcid) = newLocation(1);
                        y_position(randomAminoAcid) = newLocation(2);
                        energyChange = true;
                    else
                        proteinEnergy(step+1) = proteinEnergy(step);
                        energyChange = true;
                    end
                end
            end
        end
    else
        %Case for all amino acids between the beginning and the end
        previousAminoAcid = newStructure{randomAminoAcid -1};
        nextAminoAcid = newStructure{randomAminoAcid + 1};
        randomDirection = randperm(length(directions));
        for i=1:length(directions)
            for j=1:length(directions)
                inChain = false;
                newLocation1 = nextAminoAcid + directions{randomDirection(i)};
                newLocation2 = previousAminoAcid + directions{randomDirection(j)};
                check1 = checkAminoChain(newLocation1,newStructure);
                check2 = checkAminoChain(newLocation2,newStructure);
                if check1 || check2
                    inChain = true;%Amino acid is already inside amino chain
                end
                
                if (sqrt((previousAminoAcid(2) - newLocation1(2))^2 + ...
                        ((previousAminoAcid(1) - newLocation1(1))^2)) == 1)...
                        && (sqrt((nextAminoAcid(2) - newLocation2(2))^2 +...
                        ((nextAminoAcid(1) - newLocation2(1))^2)) == 1 && ~inChain)%Same distance on both sides
                    currentEnergy = determineStructureEnergy(newStructure,aminoEnergy,protein,proteinEnergy,step);
                    %Location1 and Location2 should be the same
                    if(currentEnergy <= proteinEnergy(step))%lower energy case
                        proteinEnergy(step+1) = currentEnergy;
                        newStructure(randomAminoAcid) = {[newLocation1(1) newLocation1(2)]};
                        x_position(randomAminoAcid) = newLocation1(1);
                        y_position(randomAminoAcid) = newLocation1(2);
                        energyChange = true;
                    else
                        if (exp(-currentEnergy /kB*temperature)) > rand%randomness case
                            proteinEnergy(step+1) = currentEnergy;
                            newStructure(randomAminoAcid) = {[newLocation1(1) newLocation1(2)]};
                            x_position(randomAminoAcid) = newLocation1(1);
                            y_position(randomAminoAcid) = newLocation1(2);
                            energyChange = true;
                        else
                            proteinEnergy(step+1) = proteinEnergy(step);
                            energyChange = true;
                        end
                    end
                end
            end
        end
    end
    %If no change has occured, keep the energy the same as the structure
    %has remained the same
    if ~energyChange
        proteinEnergy(step+1) = proteinEnergy(step);
    end
end
animateProtein(newStructure,protein,x_position,y_position);%animates the new protein
plotEnergyFunction(mcSteps,proteinEnergy, temperature);%plots the energy compared to the monte carlo step
end

function [within] = checkAminoChain(position,amino_storage)
within = false;
for i = 1: length(amino_storage)
    if isequal(position,amino_storage{i})
        within = true;
        return
    end
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

function [] = plotEnergyFunction(mcSteps, proteinEnergy,temperature)
h = figure();
h.Name = 'Energy Compared to Monte Carlo Steps'; h.MenuBar = 'none';
monteCarlo = linspace(1,mcSteps, mcSteps);
plot(monteCarlo,proteinEnergy);
xlabel('Monte Carlo Steps');
ylabel('Energy');
title(sprintf('Temperature: %d', temperature));
end

function [aminoEnergy] = randomEnergy()
lowerEnergy = -4;
higherEnergy = -2;
for i=1:20
    for j=1:20
        aminoEnergy(i,j) = (higherEnergy - lowerEnergy).*rand(1,1) + lowerEnergy;
    end
end
end