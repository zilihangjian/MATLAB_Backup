function [] = HW01_problem01(str, num)
% function [] = HW01_problem01(str, num)
% inputs - str and num. str is a string that is printed to the console, num
% is the scalar number of times it's printed to console
% outputs - nothing, only output is to the console
% Prints a string on different lines 
for i=1:num
    keyboard
    fprintf(str);
    fprintf('\n');%spaces the printing
end

end

