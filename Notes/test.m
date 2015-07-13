clear all; close all; clc;

W = 5;
Fs = 100; % large frequency to replicate continuous data
t = 0:1/Fs:W;
N = length(t);
x = cos(2*pi*t);

% Sampled x
fs = 10; % sampling frequency
Ts = 1/fs;
num = W*fs; % # of (discrete) samples to get
n = 0:num-1;
xs = cos(2*pi*n*Ts);

Xs0 = sum( xs.*exp(-1i*0.*n) )
Xs2_0 = 0;
f = -10:1/Fs:10;
for i1 = 1:length(t)
    Xs2_0 = Xs2_0 + sum( x.*exp(-1i*( (0-i1*2*pi*fs)/Ts ).*t) )/Fs;
end
Xs2_0