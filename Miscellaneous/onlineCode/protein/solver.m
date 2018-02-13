function c = solver(a)
% SOLVER:  Takes the amino acid chain, a, as input and returns the
%   corresponding configuration sequence, c.  The configuration sequence, c,
%   consists of the directions to the next successive amino acid:
%   Direction: 1 = east, i = north, -1 = west, -i = south
%
% Copyright 2002 The MathWorks, Inc.

c = [ones(length(a)-1,1)];
