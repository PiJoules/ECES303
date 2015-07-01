%% Problem 3: Auto correlation to find periodicity (Matlab required)
%{
Explanation:
The frequency of the autocorrelation of a signal is equal to the frequency
of the original signal. This is true since the corss correlation between
two signals is essentially the convolution of those signals. We can find
the frequency of the original signal with noise added by finding the
frequency of the autocorrelation.
%}
clear all; close all; clc;

measured_data;
[rxx, lags] = xcorr(meas,meas);

% Graph the autocorrelation and get a rough estimate of the period and peak
% heights.
figure;
plot(lags, rxx);
title('Autocorrelation of the signal');
grid on;
xlabel('l');
ylabel('rxx(l)');

% Get the approximate distances between each peak in terms of n. Going by
% eye, the distance between each peak is somewhere around 20, so the
% minimum distance between each peak can be some value below this. The
% graph also tends to cross 0 twice between periods. Therefore, 2 peaks one
% period away from each other must be greater than 0.
% 
% "times" are the values of n at each peak and "peaks" are the values of
% each peak.
[peaks, times] = findpeaks(rxx,'MinPeakDistance',15,'MinPeakheight',0);

% Since the times are in terms of n, and each value of n is T seconds
% apart, the period of the autocorrelation (rxx(l)) is the difference in
% time between each peak times the sampling rate (n*T).
period = mean(diff(times))*T
freq = 1/period