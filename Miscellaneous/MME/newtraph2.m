function [root,iter,ea] = newtraph2(func,dfunc,xr,es,maxit)
% Inputs:
% func is the function that is to be evaluated
% dfunc is the derivative of the function to be evaluated
% xr is the guess for the root
% es is the stopping criteria; at which error value will the iterations stop
% maxit is the number of iterations to be performed
% Outputs:
% function establishes a function for estimating the roots of a given function
% iter is the number of iterations desired
% ea is the true error associated with the estimation

if nargin<5                 % starts an if statement for when the number of arguments in newtraph() is less than 5
    maxit=50;               % the program will complete 50 iterations given above condition
end
if nargin<4                 % starts an if statement for when the number of arguments in newtraph() is less than 4
    es=0.01;                    % the program will then assume es to equal 0.01
end
iter = 0;                   % establishes the iteration counting variable, starting at 0 for our 0th iteration (initial guess)
while (1)                   % starts a while loop break structure
    xrold = xr;               % establishes a new variable to be assigned as the previous iteration’s output
    xr = xr - func(xr)/dfunc(xr);     % establishes the Newton-Raphson equation, using the guess to calculate a new value for the guess in the next iteration
    iter = iter + 1           % advances the counting variable by 1, signifying a completed iteration
    if xr~=0              % establishes an if statement for calculating the relative error of the iteration for when xr is not 0
        ea = double(100*abs((xr-xrold)/xr))     % runs an equation to calculate the relative error of the iteration relative to the previous iteration
    end
    iterations(iter) = iter;
    error(iter) = ea;
    roots(iter) = xr;
    if ea <= es || iter >= maxit      % describes the two stopping conditions for the while loop; if the error of the iteration equals to or falls below falls below the stopping criteria or the specified maximum number of iterations is reached
        break               % ends the loop break structure with the aforementioned stopping conditions
    end
end
root = double(xr);                    % changes xr to a more readable format

subplot(2,1,1);
plot(iterations, roots);
xlabel('# of Iterations');
ylabel('Estimated Root');
title('Estimated Root per Iteration');
subplot(2,1,2);
plot(iterations, error);
xlabel('# of Iterations');
ylabel('Approximate Error');
title('Error associated with each Iteration');
t = table(iterations', double(roots'), error','VariableNames',...
    {'Iterations', 'Roots', 'Error'}) %#ok<NOPRT>
end