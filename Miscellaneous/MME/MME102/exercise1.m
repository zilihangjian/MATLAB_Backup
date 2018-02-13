function [output_matrix] = exercise1(n)
output_matrix = zeros(n);
for i=1:n
    for j=1:n
        if mod(i+j,2) == 0
            output_matrix(i,j) = 1;
        else 
            output_matrix(i,j) = 0;
        end
    end
end



end