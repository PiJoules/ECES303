%% Problem 2: Resolution of sine waves
clear all; close all; clc;

fs = 5;
Ts = 1/fs;
% will need min of 5 samples (sampling freq)
% round up to 8 (power of 2)
N = 8; % # of samples
n = 0:N;

t = 0:0.01:N/fs;
f1 = 1;
f2 = 1.05;
x1 = 5*sin(2*pi*f1*t);
x2 = -5*sin(2*pi*f2*t);

omegaHat = 2*pi*f1/fs;
sig1 = 5*sin(omegaHat*n);

figure;
subplot(2,1,1);
plot(t,x1);
grid on;
subplot(2,1,2);
stem(n,sig1);

% f = 5;
% omega = 2*pi*f;
% t = 0:0.01:1;
% x1 = cos(omega*t);
% 
% fs1 = 100;
% omegaHat1 = omega/fs1;
% n1 = 0:fs1-1;
% xn1 = cos(omegaHat1*n1);
% 
% fs2 = 20;
% omegaHat2 = omega/fs2;
% n2 = 0:fs2-1;
% xn2 = cos(omegaHat2*n2);
% 
% figure;
% subplot(3,1,1);
% plot(t,x1);
% grid on;
% 
% subplot(3,1,2);
% stem(n1,xn1);
% 
% subplot(3,1,3);
% stem(n2,xn2);


