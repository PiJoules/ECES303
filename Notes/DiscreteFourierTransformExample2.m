clear all; close all; clc;

W = 2;
Fs = 100; % frequency meant to replicate continuous data
t = 0:1/Fs:W-1/Fs;
N = length(t);
x = cos(2*pi*t);

% Sampled x
fs = 20; % sampling frequency
Ts = 1/fs;
num = W*fs; % # of (discrete) samples to get
n = 0:num-1;
xn = cos(2*pi*n*Ts);

% Continuous Fourier Transform
f = -10:1/Fs:10;
X = zeros(1,length(f));
for i1 = 1:length(f)
    X(i1) = sum( x.*exp(-1i*f(i1).*t) )/Fs; % divide by Fs to replicate dt (infintesimaly small period of time)
end

% Discrete Time Fourier Transform
f2 = -10:1/Fs:10;
Xs = zeros(1,length(f2));
for i1 = 1:length(f2)
    s = 0;
    for i2 = 1:length(n)
        s = s + xn(i2)*exp(-1i*f2(i1)*i2);
    end
    Xs(i1) = s;
end

% Inverse Discrete Time Fourier Transform
n2 = 0:length(n)-1;
xsr = zeros(1,length(n2));
range = 0:1/Fs:2*pi-1/Fs;
for i1 = 1:length(n2)
    s = 0;
    for i2 = (1:length(range))+floor(length(f2)/2)
        s = s + Xs(i2)*exp(1i*f2(i2)*i1);
    end
    xsr(i1) = s/2/pi/Fs; % divide by Fs to replciate infintesimaly small dt
end

figure(1);
subplot(2,1,1)
plot(t,x);
grid on;
title('x(t)=cos(2\pit)');
xlabel('Time (s)');
ylabel('Magnitude');

subplot(2,1,2);
stem(n,xn);
title('x[n]=cos(2\pinTs)');
xlabel('n');
ylabel('Magnitude');

figure(2);
subplot(2,1,1);
plot(f,real(X));
grid on;
title('X(\omega)');
xlabel('Frequency (\omega)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f2,real(Xs));
grid on;
title('Xs(\Omega) (DTFT)');
xlabel('Frequency (\Omega)');
ylabel('Magnitude');

figure(3);
subplot(2,1,1);
stem(n2,real(xsr));
title('Reconstructed x[n]');
xlabel('n');
ylabel('Magnitude');

subplot(2,1,2);
stem(n2,xn);
title('x[n] (original)');
xlabel('n');
ylabel('Magnitude');
