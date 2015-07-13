clear all; close all; clc;

W = 10;
Fs = 100;
t = 0:1/Fs:W;
N = length(t);
x = cos(2*pi*t);

% Fourier transform
f = -8:1/Fs:8;
X = zeros(1, length(f));
for i1 = 1:length(f)
    X(i1) = sum( x.*exp(-1i*f(i1).*t) )/Fs;
end

% Inverse Fourier Transform
xr = zeros(1,N);
for i1 = 1:N
    xr(i1) = sum( X.*exp(1i.*f*t(i1)) )/Fs/2/pi;
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
title('X(f)');
ylabel('Magnitude');
xlabel('Frequency (f)');

subplot(3,1,3);
plot(t,xr);
grid on;

% figure(1);
% subplot(3,1,3);
% grid on;
% hold on;
% result = zeros(1,length(t));
% for i = 1:length(f)
%     result = result + X(i)*exp(j*2*pi*f(i)*t);
% end
% plot(t, real(result));
% title('Reconstructed wave from IFT');
% ylabel('Magnitude');
% xlabel('Time (s)');