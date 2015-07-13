clear all; close all; clc;

W = 4;
Fs = 100; % large frequency to replicate continuous data (dt)
t = 0:1/Fs:W-1/Fs;
N = length(t);
x = cos(2*pi*t);

% Fourier transform
f = -10:1/Fs:10;
X = zeros(1,length(f));
for i1 = 1:length(f)
    X(i1) = sum( x.*exp(-1i*f(i1).*t) )/Fs;
end

% Inverse Fourier Transform
xr = zeros(1,length(t));
for i1 = 1:length(t)
    xr(i1) = sum( X.*exp(1i.*f*t(i1)) )/2/pi/Fs;
end

figure(1);
subplot(3,1,1);
plot(t,x);
grid on;
title('x(t)=cos(2\pit)');
xlabel('Time (s)');
ylabel('Magnitude');

subplot(3,1,2);
plot(f,X);
grid on;
title('X(\omega)');
ylabel('Magnitude');
xlabel('Frequency (\omega)');

subplot(3,1,3);
plot(t,xr);
grid on;
title('Reconstructed x(t)');
xlabel('Time (s)');
ylabel('Magnitude');
ylim([-1 1]);