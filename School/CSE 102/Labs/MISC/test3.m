%test3

close all; 
clear;

a = [1 1 1; 1 1 1; 1 1 1];
b = [2 2 2; 2 2 2; 2 2 2];

disp(a/b);
disp(a*b);
disp(a-b);
disp(1./a);
disp(1./b);

disp(a(5)+b(5));
disp(a(5)*b(5));
disp(b(7)/a(1));