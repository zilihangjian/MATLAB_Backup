function [val] = macsin(x,n)

if nargin ~= 2
    error('Need exactly two inputs');
end

sequence = 0;
for k=1:n
    sequence = (((-1).^k).*x.^(2*k-1))./(factorial(2*k-1));
    sequence = sequence + sequence;
end
fprintf('Sin(x): %5.5f \n Maclaurin of Sin(x): %5.5f',sin(x),sequence);
val = sequence;
end