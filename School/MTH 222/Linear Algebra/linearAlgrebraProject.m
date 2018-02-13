function [] = linearAlgebraProject()
%Part 1
A = sym([3 2 3; 2 6 6; -1 -2 -1]);%Main Matrix
[P,D] = eig(A);%Generates eigenvalues
if D == P^-1*A*P
    disp('D = P^-1AP'); 
end

if P*D*P^-1 == A   
    disp('PDP^-1 = A');
end
[Q,J] = jordan(A);

%Part 2
B = sym([1 1 0; -4 9 4; 10 -19 -9]);
[P,D] = eig(B);
[Q,J] = jordan(B);

%Part 3
B^10;
J^10;

%Part 4
J = sym([a 1 0; 0 a 1; 0 0 a]);
J^2;
J^3;
J^4;