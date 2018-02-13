% 3.  For the given digital breast image, compute
% (a) image negative [1](b) Enhance the image using gamma function. 
% Then use the output of the function as input to imadjust function 
% (play with different values in imadjust function) [4]
%Part a
clc; clear;
breast = imread('breast.tif');
figure(1); imshow(breast);title('Original');xlabel('x'); ylabel('y');
negabreast = imcomplement(breast);
figure(2); imshow(negabreast);title('Image Negative');...
    xlabel('x'); ylabel('y');

%Part b
gamma = imadjust(breast, [.5 .75], [0 1]);
figure(3); imshow(gamma); title('Gamma Manipulated')...
    ;xlabel('x'); ylabel('y');
ghalf = imadjust(negabreast,[],[],.5);
g1 = imadjust(negabreast,[],[],1);
g2 = imadjust(negabreast,[],[],2);
g3 = imadjust(negabreast,[],[],3);
g4 = imadjust(negabreast,[],[],4);
g5 = imadjust(negabreast,[],[],5);
figure(4); imshow(g1);title('g: 1');xlabel('x'); ylabel('y');
figure(5); imshow(g2);title('g: 2');xlabel('x'); ylabel('y');
figure(6); imshow(g3);title('g: 3');xlabel('x'); ylabel('y');
figure(7); imshow(g4);title('g: 4');xlabel('x'); ylabel('y');
figure(8); imshow(g5);title('g: 5');xlabel('x'); ylabel('y');
figure(9); imshow(ghalf);title('g: .5');xlabel('x'); ylabel('y');

