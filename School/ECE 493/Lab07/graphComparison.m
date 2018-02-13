%IINMAX
Vin = 15;
N2 = 1;
N1 = 2;
D = 0.40;
Vout = Vin .* (N2/N1) .* (D/(1-D));
Rload = linspace(1,75,1000);
inAvg = (Vout.^2./Rload) ./ Vin;
figure()
plot(Rload, inAvg, 'g');
xlabel('Load Resistance');
ylabel('Average Input Current');
title('Average Input Current vs Load Resistance');

Lm = 100e-6;
iLMavg = .41666;
fs = linspace(1e3,100e3,1000);
inMax = iLMavg  + (.5.* ((Vin*D) ./ (Lm.*fs)));
inMin = iLMavg  - (.5.* ((Vin*D) ./ (Lm.*fs)));
figure()
hold on;
plot(fs, inMax, 'g');
plot(fs, inMin, 'r');
xlabel('Frequency');
ylabel('Max and Min Input Current');
title('Input Current vs Frequency');
legend('MAX', 'MIN');

% 
% ioutMax = (N1/N2) * inMax
% ioutMin = N1/N2 * inMin


