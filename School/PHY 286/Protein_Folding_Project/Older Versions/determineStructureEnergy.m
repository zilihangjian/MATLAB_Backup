function [energy] = determineStructureEnergy(amino_storage,...
    aminoEnergy,protein,proteinEnergy,index)
% function [structureEnergy] = determineStructureEnergy(amino_storage,...
%     aminoEnergy,protein, proteinEnergy,index)
if isempty(proteinEnergy)
    energy = 0; 
else 
    energy = proteinEnergy(index);
end

right = [1 0]; left = [-1 0]; up = [0 1]; down = [0 -1];
directions = {right, left, up, down}; %Checks areas around amino acids
energyChange = false; aminoIndex = 1;
for t = 1: length(amino_storage) %iterates through all the amino acid locations
    for i=1:length(directions)
        %Checks in all four directions of the current amino acid
        check = amino_storage{t} + directions{i};
        %Boolean value for checking if the amino acid is in the protein chain
        amino_chain = false;
        
        for k=1: numel(amino_storage)
            if isequal(amino_storage{k},check)
                amino_chain = true; % Amino Acid is within the chain
            end
        end
        
        %Deals with first case of t = 1
        if t == 1 && amino_chain && ~isequal(check,amino_storage{t+1})
            otherAmino = determineAminoPosition(check,amino_storage);%determines the position of the other aminos interaction
            structureEnergy(aminoIndex) = aminoEnergy(protein(t),protein(otherAmino));
            energyChange = true;
            aminoIndex = aminoIndex + 1;
            %Deals with final case for t = length of the chain
        elseif t == length(amino_storage) && ~isequal(check, amino_storage{t-1})...
                && amino_chain
            
            otherAmino = determineAminoPosition(check,amino_storage);
            structureEnergy(aminoIndex) = aminoEnergy(protein(t),protein(otherAmino));
            energyChange = true;
            aminoIndex = aminoIndex + 1;
            
            %Deals with all other cases associated with different t values
        elseif t < length(amino_storage) && t > 1 && amino_chain && ...
                ~isequal(check,amino_storage{t+1}) && ...
                ~isequal(check,amino_storage{t-1})
            otherAmino = determineAminoPosition(check,amino_storage);
            structureEnergy(aminoIndex) = aminoEnergy(protein(t),protein(otherAmino));
            aminoIndex = aminoIndex + 1;
            energyChange = true;
        end
        
    end
end

if ~energyChange 
    return
else  
    energy = sum(structureEnergy);
    return
end
end

function [otherAminoPosition] = determineAminoPosition(check,amino_storage)
for i=1:length(amino_storage)
    if isequal(check,amino_storage{i})
        otherAminoPosition = i;
    end
end
end


