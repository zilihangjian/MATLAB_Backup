function [powerspx, f] = fourierize(signal, t, norm)

% A signal measured in time (t) -> Fourier amplitudes (FF~, powerspx) and frequencies f 
% 

if ~exist('norm', 'var')
    norm = 1;
elseif isempty(norm)
    norm = 1;
end

if norm
	signal = signal - mean(signal);
end

L = length(t);
Fs = 1./mean(diff(t));
%t = t - t(1);

figure(1);
plot(t, signal, '-b');
ylabel('Signal Y(t)');
xlabel('time (s)')

NFFT = length(signal);
Y = fft(signal, NFFT);

inds = [0:round(NFFT/2)];
f = Fs.*inds./(NFFT);

figure(2);
powerspx = sqrt(Y(inds+1).*conj(Y(inds+1)));
plot(f, powerspx, ':.k');
title('Power spectrum of signal(t)')
xlabel('Frequency (Hz)')
ylabel('|F(\omega)|')
