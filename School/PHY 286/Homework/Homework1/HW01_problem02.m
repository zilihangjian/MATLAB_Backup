function [] = HW01_problem02(str,num)
% function [] = HW01_problem02(str,num)
% inputs - str is a string that will be printed to the console, num is a
% scalar number that determines how many times it is printed
% outputs - nothing, only output is to the console
% Prints a string on the same line
for i=1:num
    fprintf(str);%Lack of '/n' so that it prints on the same line
    fprintf('\t');%Spacing 
end

end

