clear all;close all;clc;

x = [1 7 1 0 0 0 5 5 5 0 0 0 4 5 4 0 0 0 -1 1 -1];
y = [0 0 1 1 1 0 0];
[rxy, lags] = xcorr(x,y);
[rxx, lags] = xcorr(x,x);
[ryy, lags] = xcorr(y,y);
rxy_norm = rxy./sqrt(ryy(7)*rxx(21));

[ryx, lags] = xcorr(y,x);

rng('default');
r = 1 + 2.*randn(1000,1);
m = mean(r)
s = std(r)