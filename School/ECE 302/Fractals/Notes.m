%Notes on the Fractals.m file
%seed: effects the impact of how long the for loop goes on. The largest the
%seed value is then the longer the fractal iterates and creates a larger
%and more detailed fractal
%length impacts the spacing inbetween x and y so that a more clear fractal
%is made at higher rates of subdivision between each x and y
% the line space functions of x and y determine the placement of the
% fractal in the grid. Different ranges will strech and shrink the fractal
% depending on the x and y values used. The linspace also creates the
% linearly spaced vectors that can be placed in the Z matrix that is the
% same size of the length, which means that the length means more vectors
% to work with, indiciatin the clear picture seen at higher values
% the meshgrid function allows for the output vectors from X and Y
% functions to be visualized and seen more visually as the fractal
% the Z matrix stores all of the vectors of X and Y to be placed in the
% meshgrid visualization
% z0 creates the combination of X and Y vectors with both real and
% imaginary parts
% The next for loop generates the vector using the method indicated in the
% book about the sets. This simply relies on the Z^2 value and the other C
% value added to it, which in this case is z0