function [inputX, inputY] = parseData(inputMatr)
inputX = 0;
inputY = 0;
[len, width] = size(inputMatr);
if len ~= 2 && width ~= 2
    return
end
if len > width
    inputX = inputMatr(:,1);
    inputY = inputMatr(:,2);
else
    inputX = inputMatr(1,:);
    inputY = inputMatr(2,:);
end

%Coordinate Sorting
[inputX, sortInd] = sort(inputX);
inputY = inputY(sortInd);
figure()
plot(inputX,inputY)


end