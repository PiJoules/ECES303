clear all; close all; clc;
x = [-2 -1 0 2];
y = [-1 -2 -1 -3];
% x = [2 -1 3 7 1 2 -3];
% y = [1 -1 2 -2 4 1 -2 5];

[rxy, lags] = xcorr(x,x);
rxy