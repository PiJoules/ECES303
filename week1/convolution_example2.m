close all;clear all;clc
x=[5 1 9 2]
h=[1 9 2 4]
L=length(x)+length(h)-1;
y1=conv(x,h) % MATLAB linear convolution command
% Conduct linear convolution using DFT
y2=ifft(fft(x,L).*fft(h,L))
% Conduct circular convolution using DFT
y3=ifft(fft(x).*fft(h))