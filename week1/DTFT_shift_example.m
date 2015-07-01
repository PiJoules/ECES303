close all;clear all;clc
syms w
n1=0:5;
n2=0:7;
x1=[1 2 3 4 5 6];
x2=[0 0 1 2 3 4 5 6];
DTFT_unshifted=sum(x1.*exp(-j*w*n1));
DTFT_shifted=sum(x2.*exp(-j*w*n2));
figure
subplot(2,1,1)
h1=ezplot(abs(DTFT_unshifted),[-pi pi]);
hold on
h2=ezplot(abs(DTFT_shifted),[-pi pi]);
set(h2,'color','r')
legend('Unshifted','Shifted',0)
xlabel('\omega')
title('Magnitude of DTFT')
subplot(2,1,2)
w1=-pi:.01:pi;
plot(w1,angle(subs(DTFT_unshifted,w,w1)));
hold on
plot(w1,angle(subs(DTFT_shifted,w,w1)),'r');
xlim([-pi pi])
legend('Unshifted','Shifted',0)
xlabel('\omega')
title('Phase (radians) of DTFT')