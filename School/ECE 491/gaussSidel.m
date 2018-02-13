function [x] = gaussSidel(A, b, es, maxit)
%function [x] = GaussSeidel(A, b, es, maxit)
%Inputs: A, coefficient matrix; b, right hand side vector
%        es, stopping criterion
%Outputs: x, solution vector
% x = GaussSeidel (A, b) : Gauss Seidel without relaxation
if (nargin < 2)
    error ('at least 2 input arguments required');
end

if (nargin < 4 || isempty(maxit))
    maxit = 50;
end

if (nargin < 3|| isempty(es))
    es = 0.00001;
end
[m,n] = size(A);

if m ~= n
    error ('Matrix A must be square');
end

C = A;
for i = 1:n
    C(i,i) = 0;
    x(i) = 0; %#ok<AGROW>
end

x = x';%x = transpose(x)
for i=1:n
    C(i,1:n) = C(i,1:n)/A(i,i);%Matrix division
end

for i=1:n
    d(i) = b(i)/A(i,i);  %#ok<AGROW>
end

iter = 0;
while (1)
    xold = x;
    for i = 1:n
        x(i) = d(i)-C(i,:)*x;
        if x(i) ~= 0
            ea(i) = abs((x(i) - xold(i))/x(i))*100;  %#ok<AGROW>
        end
    end
    
    iter = iter + 1;
    if (max(ea) <= es || iter >= maxit)
        break; 
    end
end