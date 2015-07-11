%% Problem 2: Resolution of sine waves
%{
What I did:
This code essentially just plots the Fourier Transform of the signal
5*sin(2*pi*1*t)-5*sin(2*pi*1.05*t) over a certain period of time. The
period over which I should get the data points for this was not given, but
the number of data points should have been found given a sampling frequency
of 5 Hz.

The minimum number of samples needed is 5 since the sampling frequency is 
5 Hz, though I will use something much higher than 5 (64 in this case), 
since 64 samples will yield enough points on the FT graph that local peaks 
will be shown clearly, the bin size will be reduced, and the FFT requires 
a number of data points equal to a power of 2.

A plot of the FT of this signal shows peaks near the highest frequency of
the signal (1.05 Hz). Padding zeros simply increases the number of points
that will be shown on the graph and decrease the bin size since all we are
adding is more data points. The overall spectrum should not be affected.

%}
clear all; close all; clc;

N = 64; % # of samples
n = 0:N-1;
fs = 5;
Ts = 1/fs;

f1 = 1;
f2 = 1.05;

% Create the signal
omegaHat1 = 2*pi*f1/fs;
omegaHat2 = 2*pi*f2/fs;
signal = 5*sin(omegaHat1*n)-5*sin(omegaHat2*n);

% Find the bin size and plot the zero centered FT
bin_inc = fs/N;
bin_vals = bin_inc*( (-N/2):1:((N/2)-1) );
figure;
fftsig = abs(fftshift(fft(signal)));
stem(bin_vals, fftsig);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT of sampled signal');

% Find the local peaks
[peaks, freqs] = findpeaks(fftsig, 'MinPeakHeight', 200);
fprintf('Peaks located at: %.3d Hz and %.3d Hz\n', bin_vals(freqs(1)), bin_vals(freqs(2)));

% Pad zeros (double the size)
for i = 1:N
    signal = [signal 0];
end

% Find the new bin size and graph the new FT of the padded signal
N = 128;
bin_inc = fs/N;
bin_vals = bin_inc*( (-N/2):1:((N/2)-1) );
figure;
fftsig = abs(fftshift(fft(signal)));
stem(bin_vals, fftsig);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT of sampled signal (with padded zeros)');

% Find the location of the peaks on the new FT graph
[peaks, freqs] = findpeaks(fftsig, 'MinPeakHeight', 200);
fprintf('Peaks (after padding) located at: %.3d Hz and %.3d Hz\n', bin_vals(freqs(1)), bin_vals(freqs(2)));
