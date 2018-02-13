function [results,message] = runcontest(drawboard)
    
% Copyright 2002 The MathWorks, Inc.

if nargin == 0
    drawboard = 0;
end

% Load the testsuite which contains the vector of 1's and 0's 
load('testsuite');

for k = 1:length(t),
    a = t(k).v;
    
    % Run the submission for current game board
    
    time0 = cputime;
    c = solver(a);
    timeElapsed = cputime-time0;

    if size(c,2)==1
        p = [0;cumsum(c)];
    else
        p = [0 cumsum(c)];
    end
    
    % plot
    if drawboard
        cla
        line(real(p),imag(p),'Color','black');
        pA = p;
        pA(a<0.5) = [];
        pB = p;
        pB(a>0.5) = [];
        line(real(pA),imag(pA),'LineStyle','none','Marker','.','Color','green')
        line(real(pB),imag(pB),'LineStyle','none','Marker','.','Color','red')
        
        axis(length(p)*[0 1 -.5 .5])
        axis equal
        drawnow
        pause
    end
    
    
   % Check the solution
    
    % Check for legal entry
    if ~all((c==1)|(c==-1)|(c==i)|(c==-i))
        error('Illegal values in returned vector')
    end

    if length(p)~=length(a)
        error('Returned vector is the wrong length')
    end

    if length(p)~=length(unique(p))
        error('The returned vector intersects itself')
    end

    % Score it
    % Calculate the distance matrix
    p = p(logical(a));
    [x,y] = meshgrid(1:length(p));
    dist = abs(p(x) - p(y));

    results(k,1) = sum(sum(dist))/2;
    results(k,2) = timeElapsed;
end
message=sprintf('Average score = %0.03f', sum(results(:,1))/size(results,1));
