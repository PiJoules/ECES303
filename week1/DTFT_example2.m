close all;clear all;clc
syms w
n=0:10;
x1=0.8.^n;
x2=0.7.^n;
a=3;
b=4;
f=a*x1+b*x2;
X1=sum(a*x1.*exp(-j*w*n));
X2=sum(b*x2.*exp(-j*w*n));
F=sum(f.*exp(-j*w*n));
w1=-pi:0.01:pi;

figure
subplot(2,1,1)
h1=ezplot(abs(X1+X2),[-pi pi]);
hold on
h2=ezplot(abs(F),[-pi pi]);
set(h2,'color','r')
xlabel('\omega (rad/s)')
title('Magnitude of DTFT')
subplot(2,1,2)
x1h=subs(X1,w,w1);
x2h=subs(X2,w,w1);
Fh=subs(F,w,w1);
plot(w1,angle(x1h+x2h));
hold on
plot(w1,angle(Fh),'r');
xlabel('\omega (rad/s)')
title('Phase of DTFT')
xlim([-pi pi])
