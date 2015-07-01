%% Problem 2: Autocorrelation of noise
clear all; close all; clc;

rng('default');
r = 1 + 2.*randn(1000,1);
m = mean(r);
s = std(r);

figure;    figure(2);

plot(r);
title(sprintf('Mean: %d Std: %d', m, s));
grid on;

figure;
means = [0 1 10];
for i = 1:length(means)
    m = means(i);
    r = m + 2.*randn(1000,1);
    [rxx, lags] = xcorr(r,r);
    subplot(3,1,i);
    stem(lags, rxx, 'filled');
    grid on;
    title(sprintf('Mean: %0.3d rxx(0): %0.3d', mean(r), rxx(500)));
end


%{
The reason for the increasing values at rxx(0) every time the mean
increases is because increasing the mean of the random spread increases
the amplitude of the wave it represents, which in turn will increase the 
amount of energy it can hold. Since the energy of a signal is its 
autocorrelation at l=0, rxx(0) should increase every time the mean 
increases. The triagular figure is a result of convoluting the two signals
with each other.
%}