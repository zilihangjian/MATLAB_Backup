%chooses a random y coord for each starbased on universe size



function y = randY()
global uSize;
y = randi([5,uSize-5]);
end