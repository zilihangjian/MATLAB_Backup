function y = dqTest(P)
V = ones(1,6);
A = 10*diag(V,1) - 20*eye(7) + 10*diag(V,-1);
A(7,7) = -10;
E = 0.25; % earthquake amplitude
n = size(A);
n = n(1,1); % dimension of system
Id = eye(n); % n by n identity matrix
b = ones(n,1); % constant vector
k = size(P);

k = k(1,2); % length of input vector P
y = ones(1,k); % initialize y
for j = 1:k
 w = 2*pi/P(j);
 V = (A + w*w*Id)\(-E*w*w*b); % solution of linear system
 y(j) = max(abs(V));
end 
plot(P, y); 
end