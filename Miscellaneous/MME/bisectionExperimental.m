function [] = bisectionExperimental(lowLim, uppLim)
% function [] = bisectionExperimental(lowLim, uppLim)

%Function Variables
g = 9.81; c = 0.25; t = 4;
% t1 = sqrt(g*m)./cd;
% t2 = sqrt((g*cd)/m)*t;
velocityFunc = @(m)(sqrt((g.*m)./c).*tanh(sqrt((g.*c)./m).*t)) - 36; 
boundary = [lowLim,uppLim];

figure()
fplot(velocityFunc, boundary);
keyboard
roots = fzero(velocityFunc, boundary);
keyboard
if velocityFunc(lowLim)*velocityFunc(uppLim) > 0 
    error('Boundary Error');
end

keyboard

end