close all;clear all;clc
% Define the basic equation
syms w
n=0:20;
x=0.8.^n; % Data set x[n]
X=sum(x.*exp(-j*w*n)); % DTFT of x[n]
figure
subplot(2,1,1)
ezplot(abs(X),[-5*pi 5*pi])
xlabel('\omega (rad/s)')
ylim([0 5.8])
title('Magnitude of DTFT')
w1=-5*pi:0.01:5*pi;
XX=subs(X,w,w1);
subplot(2,1,2)
plot(w1,angle(XX))
xlabel('\omega (rad/s)')
title('Phase of DTFT')
xlim([-5*pi 5*pi])