clear all; close all; clc;

W = 4;
Fs = 100; % frequency meant to replicate continuous data
t = 0:1/Fs:W;
N = length(t);
x = cos(2*pi*t);

% Sampled x
fs = 20; % sampling frequency
Ts = 1/fs;
num = W*fs; % # of (discrete) samples to get
n = 0:num-1;
xs = cos(2*pi*n*Ts);

% Continuous Fourier Transform
f = -10:0.01:10;
X = zeros(1,length(f));
for i1 = 1:length(f)
    s = 0;
    for i2 = 1:length(t)
        s = s + x(i2)*exp(-j*f(i1)*t(i2));
    end
    X(i1) = s/N;
end

% Discrete Fourier Transform
f2 = -10:0.01:10;
Xs = zeros(1,length(f2));
for i1 = 1:length(f2)
    s = 0;
    for i2 = 1:length(n)
        s = s + xs(i2)*exp(-j*f2(i1)*i2);
    end
    Xs(i1) = s/num;
end

% Discrete Fourier Transform (as sum of FTs)
f3 = -10:0.01:10;
Xs2 = zeros(1,length(f3));
for i1 = 1:length(f3)
    s = 0;
    for i2 = floor(-length(x)/2:1:length(x)/2-1)
        % Fourier Transform at this frequency
        s = s + sum(x.*exp(-j*( (f3(i1)-i2*2*pi)/Ts ).*t))/N;
    end
    Xs2(i1) = s/Ts/length(x);
end

% Inverse Discrete Fourier Transform
n2 = 0:length(n)-1;
xsr = zeros(1,length(n2));
range = 0:0.01:2*pi-0.01;
for i1 = 1:length(n2)
    s = 0;
    for i2 = (1:length(range))+floor(length(f3)/2)
        s = s + Xs(i2)*exp(j*f3(i2)*i1);
    end
    xsr(i1) = s/2/pi;
end

figure(1);
subplot(2,1,1)
plot(t,x);
grid on;

subplot(2,1,2);
stem(n,xs);

figure(2);
subplot(3,1,1);
plot(f,real(X));
grid on;

subplot(3,1,2);
plot(f2,real(Xs));
grid on;

subplot(3,1,3);
plot(f3,real(Xs2));
grid on;

figure(3);
subplot(2,1,1);
stem(n2,xsr);

subplot(2,1,2);
stem(n,xs);
