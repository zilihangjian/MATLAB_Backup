%DC Link Capacitor Sizing
P0 = 2e3; %Real Power 
fc = 200; %Fundamental Frequency
Vdc = 48; %DC input
ripple = 0.15;%Amount of allowable ripple
Vripple = Vdc*ripple;%Max Allowable Voltage Ripple

C = P0 / (2*pi*fc*Vdc*Vripple*2);
disp(C);

