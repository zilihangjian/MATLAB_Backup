function [x] = buildLogisiticMap(x0,mu,nmax)
%if x0 does not exist, will 
if ~exist('x0','var')
    x0 = rand;
elseif isempty(x0);
    x0 = rand;
end

x = zeros(nmax,1);
y = zeros(nmax,1);
x(1) = x0;
for n=2:nmax
    x(n) = f_logisitic(x(n-1),mu);
end

if nargout == 0 %make this function plot x vs generation
    plot(1:nmax,x,':*b');
    set(gca,'Fontsize',15);
    xlabel('Generation: n');
    ylabel('x[n]');
    title(sprintf('x (n=1)=\\mu*x n*(1-x_n): mu = %f, x0 = %f', mu, x0));
    ylim([0,1]);
end

end