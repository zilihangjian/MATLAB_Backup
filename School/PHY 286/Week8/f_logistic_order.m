function [fx] = f_logistic_order(x, mu, order)

%
% function [fx] = f_logistic_order(x, mu)
% 
% for order = 1 (default)
	% evaluate the function fx = mu.*x.*(1-x);
	% vectorized for x inputs. 
% mu is still expected to be scalar (not checked!)
% if order > 1, then call recursively...

if ~exist('order', 'var')
	order = 1;
elseif isempty(order)
	order = 1;
end

if order < 1
	error('order has to be 1 or greater');
end

if ~isinteger(order)
	order = int16(order); %force into signed integer type
end

if order == 1
	fx = mu.*x.*(1-x);
else
	fx = f_logistic_order(mu.*x.*(1-x), mu, order-1);
end
