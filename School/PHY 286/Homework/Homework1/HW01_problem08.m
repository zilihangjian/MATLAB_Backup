function [repetitions] = HW01_problem08(str,character)
%function [repetitions] = HW01_problem08(str,character)
% Input - Two strings, the first being any kind of string, while the second
% is a string of length one that functions as a character
% Output - An integer representing the number of times that character was
% found in the str
% This programm calculates the number of time a specificed input character
% is found with the input string

%Variable Declaration
repetitions = 0;%Default value
for i=1:length(str)
    if isequal(str(1,i),character)%Treats str like a vector and compares...
        % each value to the character input with the iseqal function
        repetitions = repetitions + 1;
    end
end

end

