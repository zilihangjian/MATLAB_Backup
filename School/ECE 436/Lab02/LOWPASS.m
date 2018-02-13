clear; clc; close all;
wc = [10,20,30,50,100,150,200];%Cutoff Frequency in [rad/s]
figure()
hold on
for j = 1: length(wc)
    lp = tf([wc(j)], [1,wc(j)]);
    bode(lp);
end
plot([pi,pi],[0,-60]);
legend('10 rad/s','20 rad/s','30 rad/s','50 rad/s',...
    '100 rad/s','150 rad/s','200 rad/s','Control Signal',...
    'Location','best');



