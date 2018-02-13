%HW5_436
clc; close all; clear;
M = [1,2];
sysCell = cell(1,2);
sysCell{1} = tf([1/6], [M(1)/6, 1]);
[tf1N, tf1D] = tfdata(sysCell{1});
sysCell{2} = tf([1/6], [M(2)/6, 1]);
[tf2N, tf2D] = tfdata(sysCell{2});
t = linspace(0,2,10000);
unitStep = heaviside(t);
timeConstants = [tf1D{1}(1), tf2D{1}(1)];
tRise = 2.2.*timeConstants;
tFall = 4.*timeConstants;
figure()
for j =1: length(M)
    hold on;
    subplot(length(M),1,j)
    Y = lsim(sysCell{j},unitStep,t);
    plot(t, Y,[tRise(j),tRise(j)], [0,max(Y)],'r', [tFall(j),tFall(j)], [0,max(Y)],'r');
    title(sprintf('Velocity versus Force Transfer Function | M = %g',M(j)));
    fprintf('System %g\nRise Time | %g\nFall Time | %g\nTime Constant | %g\n',j, tRise(j), tFall(j), timeConstants(j));  
    hold off
end
