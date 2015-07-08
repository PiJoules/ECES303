%% ECE-S390 Summer 2013 windowing functions demo
%% Description
% demonstration of fft, windows and plotting techniques
% 7/9/2012
% Dr. Tom Chmielewski

%% Define a bandlimited signal with two single sine waves
f = 10; %frequency in Hz
f2 = 12;
Fs = 10*f;  % sample fast
Ts = 1/Fs;  % sampling period

N = 1024;  % number of samples
n = 0:1:N-1;  % index note
sig = 4*cos(2*pi*f*n*Ts)+ 2*cos(2*pi*f2*n*Ts);

% plot signal but only first 50 points
nd = 1:1:50;
figure
stem((nd-1)*Ts, sig(nd), 'filled')
title('sampled cosine wave first 50 points')
xlabel('nTs')
ylabel('f(nt)')

%% take the fft and display the magnitude

bin_inc = Fs/N;
bin_vals = bin_inc*((-N/2):1:((N/2)-1));
figure
stem(bin_vals, abs(fftshift(fft(sig))));
title('fft of sampled signal rectangular window')
xlabel('Hz')
ylabel('magnitude')

%% now apply a windowing function prior to displaying fft
L = N;
wham = window(@hamming,L);
whan = window(@hann,L);
wbl = window(@blackmanharris,L);
wr = window(@rectwin, L);

%% plot time domain windowing functions
figure
plot(1:L,[wbl, wham,  wr], 'linewidth', 2); axis([-1 L+1 0 1.5]);
legend( 'BlachmanHarris', 'Hamming', 'rectangular');
title('windowing functions for L = 1024')
title('time domain windowing functions')

%% plot fft of windowing functions
figure
stem(bin_vals, abs(fftshift(fft(wham))), 'filled')
title('hamming window')
axis([-2, 2, 0, 500])
figure
stem(bin_vals, abs(fftshift(fft(wbl))), 'filled')
title('BlackmanHarris window')
axis([-2, 2, 0,500])
%% show fft of signal mutlitpied by windowing functins

sig_ham = sig.*wham';  % take transpose col vector
sig_wbl = sig.*wbl';

figure
stem(bin_vals, abs(fftshift(fft(sig))));
title('fft of sampled signal rectangular window')
xlabel('Hz')
ylabel('magnitude')
figure
stem(bin_vals, abs(fftshift(fft(sig_ham))));
title('fft of sampled signal hamming window')
xlabel('Hz')
ylabel('magnitude')
figure
stem(bin_vals, abs(fftshift(fft(sig_wbl))));
title('fft of sampled signal BlackmanHarris window')
xlabel('Hz')
ylabel('magnitude')

%% redo with only +/- 20 Hz
figure
stem(bin_vals, abs(fftshift(fft(sig))));
title('fft of sampled signal rectangular window')
xlabel('Hz')
ylabel('magnitude')
axis([-20, 20, 0, 1000])
figure
stem(bin_vals, abs(fftshift(fft(sig_ham))));
title('fft of sampled signal hamming window')
xlabel('Hz')
ylabel('magnitude')
axis([-20, 20, 0, 1000])
figure
stem(bin_vals, abs(fftshift(fft(sig_wbl))));
title('fft of sampled signal BlackmanHarris window')
xlabel('Hz')
ylabel('magnitude')
axis([-20, 20, 0, 1000])
