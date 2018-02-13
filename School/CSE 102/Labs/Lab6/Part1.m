%Part 1 Bit Maps

%Part a
clc; close all; 
caribou = imread('caribou.jpg');

B1=bitget(caribou,1); 
B2=bitget(caribou,2); 
B3=bitget(caribou,3); 
B4=bitget(caribou,4); 
B5=bitget(caribou,5);
B6=bitget(caribou,6);
B7=bitget(caribou,7); 
B8=bitget(caribou,8); 

figure();
subplot(2,5,1);imshow(caribou);    title('Original');  
subplot(2,5,2);imshow(logical(B1));title('1');      
subplot(2,5,3);imshow(logical(B2));title('2');    
subplot(2,5,4);imshow(logical(B3));title('3');     
subplot(2,5,5);imshow(logical(B4));title('4');     
subplot(2,5,6);imshow(logical(B5));title('5');    
subplot(2,5,7);imshow(logical(B6));title('6');     
subplot(2,5,8);imshow(logical(B7));title('7');     
subplot(2,5,9);imshow(logical(B8));title('8');     

%part b
miami = imread('Miami.jpg');
miamiGray = rgb2gray(miami);
MG7 = bitget(miamiGray,7);
MG6 = bitget(miamiGray,6);

figure(); imshow(logical(MG7)); title('7');
figure(); imshow(logical(MG6)); title('6');

MGnew = MG6 + MG7;

figure(); imshow(logical(MGnew)); title('Bitplane 6 and 7');