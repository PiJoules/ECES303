%% Problem 12.24f
clear all; close all; clc;

x = [-2 -1 0 2];
y = [-1 -2 -1 -3];

% Linear convolution
lc = conv(x,y)

% Circular convolution
cc = ifft(fft(x).*fft(y))

% Rxy
[rxy, lags] = xcorr(x,y);
rxy

% Ryx
[ryx, lags] = xcorr(y,x);
ryx

% Rxx
[rxx, lags] = xcorr(x,x);
rxx