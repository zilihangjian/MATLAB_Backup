A = zeros(10);
A(3:7,3:7) = ones(5);
mesh(A)
H = [1 2 1; 0 0 0; -1 -2 -1];
Y = filter2(H,A,'full');
mesh(Y)
