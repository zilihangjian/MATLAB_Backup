% 2. Consider two 8-bit images whose gray levels span the full range from 0 to 255.
% (a) Discuss the limiting effect of repeatedly subtracting image (b) from image (a).
% (b) Would reversing the order of the images yield a different result? [2]
% Assumption:
% (a)	Chicken image
% (b)	Chicken image divided by 4 (dark image)
clc; clear;
chicken = imread('chickens.bmp');
darkChicken = chicken/4;
figure(1); imshow(chicken);title('Original');xlabel('x');ylabel('y');
figure(2); imshow(darkChicken);title('Divide by 4');xlabel('x');...
    ylabel('y');

% b-a for 4 iterations
c1 = darkChicken - chicken;
figure(3); imshow(c1);title('Dark - Original: 1');xlabel('x');ylabel('y');
c2 = darkChicken - c1;
figure(4); imshow(c2);title('Dark - Original: 2');xlabel('x');ylabel('y');
c3 = darkChicken - c2;
figure(5); imshow(c3);title('Dark - Original: 3');xlabel('x');ylabel('y');
c4 = darkChicken - c3;
figure(6); imshow(c4);title('Dark - Original: 4');xlabel('x');ylabel('y');

%a-b for 5 iterations
d1 = chicken - darkChicken;
figure(8); imshow(d1);title('Original - Dark: 1');xlabel('x');ylabel('y');
d2 = darkChicken - d1;
figure(9); imshow(d2);title('Original - Dark: 2');xlabel('x');ylabel('y');
d3 = darkChicken - d2;
figure(10); imshow(d3);title('Original - Dark: 3');xlabel('x');ylabel('y');
d4 = darkChicken - d3;
figure(11); imshow(d4);title('Original - Dark: 4');xlabel('x');ylabel('y');
d5 = darkChicken - d4;
figure(12); imshow(d5);title('Original - Dark: 5');xlabel('x');ylabel('y');
