WP = 6e3; %Passband Edge 6kHz
WS = 2.4e3; %Stopband Edge 2.5kHz
Rp = 0.25; %Peak Passband Ripple
Rs = 40; %Stopband Attenuation

[N,~] = buttord(WP,WS,Rp, Rs,'s');
fprintf('Butterworth Filter Order | %g\n', N);