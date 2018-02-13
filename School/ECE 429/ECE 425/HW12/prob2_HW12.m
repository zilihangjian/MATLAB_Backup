WP = [30e3, 45.8333e3]; %Passband Edge 6kHz
WS = [27e3, 55e3]; %Stopband Edge 2.5kHz
Rp = 0.25; %Peak Passband Ripple
Rs = 40; %Stopband Attenuation

[N,~] = ellipord(WP,WS,Rp, Rs,'s');
fprintf('Elliptic Filter Order | %g\n', N);