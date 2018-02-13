

function [names] = readFile(file)
%--------------------------------------------------------------------------
% DESCRIPTION: Read the names from a data file.
%
%      INPUTS: None
%
%     OUTPUTS: out   - a 2D matrix of characters where each row
%                             contains the info from a corresponding line.
%              
%--------------------------------------------------------------------------

fid = fopen(file, 'r'); % open file for reading
if fid == -1
  fprintf('Error: file could not be opened.\n');
  names = []; % we don't know how long the files is, how many rows
else    
  
  count = 0;
  while ~ feof(fid) 
    count = count + 1;
    
    Name = fscanf(fid,'%s', 1);
    names(count, 1:length(Name)) = Name;
    
  end
  
  fprintf('\n');
  fclose(fid); %close file
end

end 

