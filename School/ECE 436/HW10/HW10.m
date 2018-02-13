clc; clear; close all;
%Problem 6

%Breakaway Points
polyEQ = [2,28,120,156];
proots = roots(polyEQ);
fprintf('Root | %g\n',proots);

%Root Locus Plot
sys1 = zpk([-6],[-2 -3 -5],1);
figure()
rlocus(sys1);

%Step Response without PD Control
GCL1 = feedback(sys1,1);
figure()
step(GCL1);

%Step Reponse with PD Control
PD1 = tf([4.762,34.33],[1]);
GCL2 = feedback(PD1*sys1,1);
figure()
step(GCL2);

%Problem 27
sys2 = zpk([],[-1 -6 -10],1);
figure()
rlocus(sys2);

%Step Response without PID Control
GCL3 = feedback(sys2,1);
figure()
step(GCL3);

%Step Response with PD Control
PD2 = tf([70.21,938.7077],[1]);
GCL4 = feedback(PD2*sys2,1);
figure()
step(GCL4);

%Step Response with PID Control
PI = tf([1,0.80,0.16],[1,0,0]);
PID = PI*PD2;
GCL5 = feedback(PID*sys2,1);
figure()
step(GCL5);