clear all; close all; clc;

t = 0:0.01:2*pi;
x = zeros(1,length(t));
for i = 1:length(t)
    x(i) = exp(j*t(i));
end
figure;
plot(t,x);