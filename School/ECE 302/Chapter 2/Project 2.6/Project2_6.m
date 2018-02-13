%Project 2.6
clc; clear;
%Part 1

figure();
x = 0:.2e-3:50e-3;
y1 = 170*sin((2*pi)*60*x);
plot(x,y1, 'r');
title('Single Waveform');
grid;
xlabel('x');
ylabel('y');

%Part 2 
u1 = y1.^2;
RMS1 = sqrt(mean(u1));
z1 = rms(y1);% calculates the RMS value for the function
if(RMS1 == z1)
    fprintf('Waveform RMS is: %f\n',RMS1);  
end

%Part 3
figure();
y2 = -170*sin((2*pi)*60*x);
plot(x, y2, 'r', x, y1, 'g');
grid;
title('Double Waveform');
xlabel('x');
ylabel('y');

q1 = y2 - y1;%Difference Waveform
figure();
plot(x, q1, 'b');
title('Difference Waveform');
grid;
xlabel('x');
ylabel('y');
u2 = q1.^2;
RMS2 = sqrt(mean(u2));
z2 = rms(q1);
if(RMS2 == z2)
    fprintf('Difference Waveform RMS is: %f\n', RMS2);
end

%Part 4
figure();
y3 = 170*sin((2*pi)*60*x + (2*pi/3));
plot(x, y1, 'g', x, y3, 'b');
title('120 Degree Separated Waveforms');
xlabel('x');
ylabel('y');
grid;

q2 = y3 - y1;
plot(x, q2, 'r');
title('120 Degree Separated Difference Waveform');
xlabel('x');
ylabel('y');
grid;

u3 = q2.^2;
RMS3 = sqrt(mean(u3));
z3 = rms(q2);
if(RMS3 == z3)
    fprintf('120 Degree Separated Difference Waveform RMS is: %f\n', RMS3);
end    