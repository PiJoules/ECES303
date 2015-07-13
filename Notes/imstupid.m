clear all; close all; clc;

W = 1000;
Fs = 100; % large frequency meant to replicate continuous data
t = (0:W-1)/Fs;
N = length(t);
x = cos(2*pi*t);

% Sampled x
fs = 10; % sampling frequency
Ts = 1/fs;
num = W*fs; % # of (discrete) samples to get
n = 0:num-1;
xs = cos(2*pi*n*Ts);

f = (-N/2:1:N/2-1)*Fs/N;
X = fftshift(fft(x));

% Discrete Time Fourier Transform
f2 = -10:1/Fs:10;
Xs = zeros(1,length(f2));
for i1 = 1:length(f2)
    s = 0;
    for i2 = 1:length(n)
        s = s + xs(i2)*exp(-1i*f2(i1)*i2);
    end
    Xs(i1) = s;
end

figure;
plot(f,real(X));
xlim([-4 4]);

figure;
xr = ifft(ifftshift(X));
subplot(2,1,1);
plot(t,x);
subplot(2,1,2);
plot(t,xr);

figure;
plot(f2,Xs);