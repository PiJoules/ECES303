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

% Fourier transform
N = length(t);
f = -2:1/Fs:2;
X = zeros(1, length(f));
for i = 1:length(f)
    X(i) = sum(x.*exp(-j*2*pi*f(i).*t))/N;
end

% Discrete Time Fourier Transform
Xs = zeros(1,length(f));
for i = 1:length(f)
    Xs(i) = sum(xs.*exp(-j*2*pi*f(i).*n))/num;
end

% DTFT as sum of FT
Xs2 = zeros(1,length(f));
for i = 1:length(f)
    Xc = 0;
    for k = floor(-length(f)/2:1:length(f)/2-1)
        Xc = Xc + sum(x(1:length(f)).*exp(-j*2*pi.*( (f(i)-k)/Ts ).*t(1:length(f))))/N;
    end
    Xs2(i) = Xc/Ts;
end

figure(1);
subplot(2,1,1);
plot(t,x);
grid on;
title('x(t)=cos(2\pit)');
xlabel('Time (s)');
ylabel('Magnitude');

subplot(2,1,2);
stem(n,xs);
title('x[n] (sampled every 0.1 s)');
ylabel('Magnitude');
xlabel('n');

figure(2);
subplot(3,1,1);
plot(f,X);
title('Fourier Transform of x(t)=cos(2\pit)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,2);
plot(f,Xs);
title('DTFT of x[n] (sampled every 0.1s)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,3);
plot(f,Xs2);
