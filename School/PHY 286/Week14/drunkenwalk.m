function [x] = drunkenwalk(N,ssize)

if ~exist('ssize','var')
    ssize = 1;
end

x = zeros(1,N);
for n=2:N
    if rand < .5
        step = -rand*ssize;
    else 
        step = rand*ssize;
    end
    x(n) = x(n-1) + step;
end

end

