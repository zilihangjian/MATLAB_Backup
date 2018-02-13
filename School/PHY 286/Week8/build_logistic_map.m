function [x] = build_logistic_map(x0, mu, nmax)

%
% function [x] = build_logistic_map(x0, mu, nmax)
% the logistic 2-system population growth model
% trajectory of x(i+1) = mu*(1-x(i))*xi 
% i = generation, for the first generation, x0 is given
% 	no checking done for x0 > 1 (what happens then?)
% if x0 is not-defined or empty, use a random seed
% nmax = number of generations to iterate
% 
% use call to f_logistic_order.m 

if ~exist('x0', 'var')
	x0 = rand; %get a random seed
elseif isempty(x0)
	x0 = rand; %get a random seed
end

x = zeros(nmax, 1);
x(1) = x0;
for n=2:nmax
	x(n) = f_logistic_order(x(n-1), mu);
end

gens = [1:nmax];
if nargout == 0
	plot(gens, x, '*:k');
	set(gca, 'Fontsize', 15);
	xlabel('Generation, n');
	ylabel('x(n)');
	title(sprintf('x_{n+1}=\\mu*x_n*(1-x_n): mu=%f, x_0=%f', mu, x(1)));
end
