%% Problem 1: Energy
clear all; close all; clc;

xn = [1 1 1 1 3 3 3 3 -1 -1 -1 -1 1 1 1 1];
bin_inc = 2*pi/length(xn);

% a. Compute the energy of the singal using DFT/FFT.
Xk = fft(xn);
E = sum(abs(Xk).^2)/length(Xk);
fprintf('Energy: %d Joules\n', E);

% b. Validate your results by finding the energy using the time sequence.
Et = sum(abs(xn).^2);
fprintf('Energy (from time sequence): %d Joules\n', Et);

% c. Plot the energy density.
figure;
k = 1:length(Xk);
Ek = Xk.*conj(Xk)/length(Xk);
f = k*bin_inc;
plot(f, Ek);
grid on;
xlabel('frequency (rad/s)');
ylabel('E(k) Joules');
title('Spectral Energy Density');

% d. Plot the integral of the energy density.
cummulativeEnergy = cumsum(Ek);
k2 = 1:length(xn);
f2 = k2*bin_inc;
figure;
plot(f2,cummulativeEnergy);
grid on;
xlabel('frequency (rad/s)');
ylabel('Cummulative Energy (J)');
title('Cummulative Energy Density');

