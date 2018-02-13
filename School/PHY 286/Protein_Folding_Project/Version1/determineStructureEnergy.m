function [structureEnergy] = determineStructureEnergy(amino_storage)
%function [structureEnergy] = determineStructureEnergy(amino_storage)

structureEnergy = 0; %Determines the energy associated with a protein chain
right = [1 0]; left = [-1 0]; up = [0 1]; down = [0 -1];
directions = {right, left, up, down}; %Checks areas around amino acids
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
            structureEnergy = structureEnergy + 1;
        end
        
        %Deals with final case for t = length of the chain
        if t == length(amino_storage) && ~isequal(check, amino_storage{t-1})...
            && amino_chain
        
            structureEnergy = structureEnergy + 1;
           
        end
        
        %Deals with all other cases associated with different t values
        if t < length(amino_storage) && t > 1 && amino_chain && ...
                ~isequal(check,amino_storage{t+1}) && ...
                ~isequal(check,amino_storage{t-1})
         
            structureEnergy = structureEnergy + 1;
        end
        
    end

end
structureEnergy = ceil(structureEnergy/2);
end