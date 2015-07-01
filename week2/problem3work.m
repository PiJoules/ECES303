%% Problem 3: Auto correlation to find periodicity (Matlab required)
clear all; close all; clc;

measured_data;
%meas = sin(2*pi/(0.21)*(n*T))+rand(1,N);
figure;
subplot(3,1,1);
plot(n,meas);
title('sampled wave');
grid on;
axis([50 150 min(meas) max(meas)]);
set(gca, 'xtick', 50:10:150);
grid on;
[rxx, lags] = xcorr(meas,meas);

% Find the peaks and get the avg distance between each one
[peaks_long, times_long] = findpeaks(rxx,'MinPeakDistance',10,'MinPeakheight',0);
period_long = mean(diff(times_long))*T
subplot(3,1,2);
plot(times_long, peaks_long);
title('peaks');
grid on;
xlim([150 250]);
set(gca, 'xtick', 150:10:250);

subplot(3,1,3);
plot(lags, rxx);
title('rxx');
%axis([-50 50 min(rxx) max(rxx)]);
xlim([-50 50])
set(gca, 'xtick', -50:10:50);
grid on;