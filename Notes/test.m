clear all; close all; clc;

W = 5;
fs = 100;
t = -W:1/fs:W;
N = length(t);
%x = rectangularPulse(-W/2,W/2,t);
%x = triangularPulse(t);
x = cos(2*pi*t);

% Fourier transform
bin_inc = fs/N;
f = (-N/2:1:N/2-1)*bin_inc;
X = zeros(1, length(f));
for i = 1:length(f)
    X = X + x(i)*exp(-j*2*pi*f(i)*t)/N;
end

figure(1);
subplot(2,1,1);
plot(t,x);
grid on;
title('g(t)=cos(2\pit)');
xlabel('Time (s)');
ylabel('Magnitude');

figure(1);
subplot(2,1,2);
stem(f,X);
xlim([-2 2]);
grid on;
title('Fourier Transform of g(t)');
ylabel('Magnitude');
xlabel('Frequency (f)');

% figure(1);
% subplot(3,1,3);
% grid on;
% hold on;
% result = zeros(1,length(t));
% for i = 1:length(f)
%     result = result + X(i)*exp(j*2*pi*f(i)*t);
% end
% plot(t, real(result));