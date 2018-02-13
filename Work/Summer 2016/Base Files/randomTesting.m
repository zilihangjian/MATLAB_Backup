function [elements, initialCoordinates, lengths, angles] = randomTesting()
elements = randi(10,1);
initialCoordinates = cell(1,elements);
lengths = zeros(1, elements);
angles = zeros(1, elements);
for j = 1: elements
    initialCoordinates{j} = [10*rand(1) 10*rand(1)];
    lengths(j) = 100;
    angles(j) = 360*rand(1);
end

end


