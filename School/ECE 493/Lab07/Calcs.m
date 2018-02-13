Vin = 15;
Rload = [5,5,10];
N2 = 1;
N1 = 2;
D = 0.40;
Vout = Vin .* (N2/N1) .* (D/(1-D));
Lm = 100e-6;
fs = [100e3, 50e3, 50e3];
inAvg = (Vout.^2./Rload) ./ Vin;
inMax = inAvg + (.5.* ((Vin*D) ./ (Lm.*fs)))

inMin = inAvg - (.5.* ((Vin*D) ./ (Lm.*fs)))

ioutMax = (N1/N2) * inMax
ioutMin = N1/N2 * inMin


