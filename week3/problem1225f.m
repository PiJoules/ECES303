clear all; close all; clc;
xk = [22, -4+i*2, -6, -4-i*2];
yk = [8, -2-i*2, 0, -2+j*2];

xn = ifft(xk)
yn = ifft(yk)

conv(xn,yn)

wk = xk.*yk
wn = ifft(wk)