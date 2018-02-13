clc; clear; close all;
%Part 6
monaLeft = imread('monalisa L.bmp');
monaRight = imread('monalisa R.bmp');
rightFlip = fliplr(monaRight);
leftFlip = fliplr(monaLeft);

monalisaR = imadd(monaRight, rightFlip);
monalisaL = imadd(monaLeft, leftFlip);

figure(11); imshow(monalisaR);title('Monalisa Right');... 
    xlabel('x');ylabel('y'); 
figure(12); imshow(monalisaL);title('Monalisa Left');...
    xlabel('x');ylabel('y'); 
