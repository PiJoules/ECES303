close all;clear all;clc
w0=1; % Frequency shift
syms w
n=-5:0;
x1=sin(0.1*n);
x2=sin(0.1*n).*exp(j*w0*n);
unshifted=sum(x1.*exp(-j*w*n));
shifted=sum(x2.*exp(-j*w*n));
figure
subplot(2,1,1)
h1=ezplot(abs(unshifted),[-pi pi]);
hold on
h2=ezplot(abs(shifted),[-pi pi])
set(h2,'color','r')
xlabel('\Omega')
title ('Magnitude of DTFT')
legend('Unshifted','Shifted')
subplot(2,1,2)
w1=-pi:.01:pi;
plot(w1,angle(subs(unshifted,w,w1)))
hold on
plot(w1,angle(subs(shifted,w,w1)),'r')
xlabel('\Omega')
ylabel('Phase (radians) of DTFT')
legend('Unshifted','Shifted')
xlim([-pi pi])