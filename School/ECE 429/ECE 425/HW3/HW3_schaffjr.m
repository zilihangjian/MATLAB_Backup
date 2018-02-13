% Johnathan Schaff, ECE 425 HW3
clc; clear;
r = audiorecorder(11025, 16, 1); %Record voice on single channel with 16 bits at 11.025kHz
recordblocking(r,3); %Record for three seconds
x = getaudiodata(r, 'double'); %Initial x[n] saved from recording   
x = (0.95/(max(abs(x)))).*x;%Set max amplitude to 0.95
play(r); %Play the auido recording back
pause();
audiowrite('voice_8000.wav',x,8000); %wav file 1 at sampling rate of 8000
audiowrite('voice_16000.wav',x,16000);%wav file 2 at sampling rate of 12000
%Moving Filter Design 
% function y[n] = 0.70*x[n] + 0.20*x[n-30] + 0.10*x[n-100]
B = zeros(1,101);%Due to MATLAB starting to index at 1 rather than zero, the vector needs to be shifted by 1 to account for it 
B(1) = 0.70;
B(31) = 0.20;
B(101) = 0.10;
A = 1;
y = filter(B,A,x);
sound(y,11025);%Play the sound at the specified 11025 frequency
audiowrite('voice11025.wav',y,11025);%wav file 3 at sampling rate of 11025