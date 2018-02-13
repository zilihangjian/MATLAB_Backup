function [energy] = structureEnergy(aminoEnergy, protein, amino_storage)

right = [1 0]; left = [-1 0]; up = [0 1]; down = [0 -1];
directions = {right, left, up, down}; %Checks areas around amino acids for those not covalently bonded but in the chain
aminoAcidEnergy = []; aminoIndex = 1;
for t = 1: length(amino_storage) %iterates through all the amino acid locations
    currentAminoAcid = amino_storage{t};
    for i=1:length(directions)%Checks the surronding areas around the amino acid
        surrondingArea = currentAminoAcid + directions{i};
        inChain = checkInChain(amino_storage, surrondingArea);
        precedingAminoAcid = checkNearbyAminoAcids(t,amino_storage, surrondingArea);
        
        if inChain && ~precedingAminoAcid
            otherAmino = determineAminoPosition(surrondingArea,amino_storage);
            aminoAcidEnergy(aminoIndex) = aminoEnergy(protein(t),protein(otherAmino));
            aminoIndex = aminoIndex + 1;
        end
    end
end
energy = sum(aminoAcidEnergy);
end

function [precedingAminoAcid] = checkNearbyAminoAcids(t,amino_storage,surrondingArea)
precedingAminoAcid = false;
if t == 1
    if isequal(amino_storage{t+1},surrondingArea)
        precedingAminoAcid = true;
    end
    
elseif t == length(amino_storage)
    if isequal(amino_storage{t-1},surrondingArea)
        precedingAminoAcid = true;
    end
    
else
    if isequal(amino_storage{t-1},surrondingArea) || ...
            isequal(amino_storage{t+1},surrondingArea)
        precedingAminoAcid = true;
    end
end

end

function [inChain] = checkInChain(amino_storage,check)
inChain = false;
for k=1: numel(amino_storage)
    if isequal(amino_storage{k},check)
        inChain = true; % Amino Acid is within the chain
    end
end

end

function [otherAminoPosition] = determineAminoPosition(check,amino_storage)
for i=1:length(amino_storage)
    if isequal(check,amino_storage{i})
        otherAminoPosition = i;
    end
end

end