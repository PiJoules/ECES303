clear all; close all; clc;

t = 0:0.0001:2/180;
x = sin(2*pi*180*t);
X = fft(x);
plot((0:length(X)-1)-length(X)/2,abs(X));
n = 0:99;
y = sin(2*pi*180*(n/100));

% figure;
% subplot(2,1,1);
% plot(t,x);
% subplot(2,1,2);
% plot(n,y);