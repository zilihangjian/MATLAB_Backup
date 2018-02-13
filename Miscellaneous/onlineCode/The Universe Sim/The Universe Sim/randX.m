%picks a random x coord based on universe size



function x = randX()
global uSize;
x = randi([5,uSize-5]);
end