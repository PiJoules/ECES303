%%  energy test
%  Created 14 February 2005
%  Revised 7 July 2013 for ECE-S390
clear all
close all
clc
%% create waveform data
a1 = [0 1 1 1 1 0 0 0 0 0 -1 -1 -1 -1 0]
a2 = [0 1 1 1 1 1 1 0 0 0 0 0 -1 -1 -1 -1 -1 -1 0]
a = a1;   % select waveform to use for analysis you can add others
v = cumsum(a); % integrate to get velocity
p = cumsum(v); % integrate to get position

d_pnts = max(size(a))

%%  plot out time waveforms
figure
subplot(3,1,1)
plot(p, 'k')
hold
stem(p, 'linewidth', 3)
title('position derived from velocity')
subplot(3,1,2)
plot(v, 'g', 'linewidth', 3)
hold
stem(v)
title('velocity dervied from acceleration')
subplot(3,1,3)
plot(a)
hold
stem(a, 'r', 'linewidth', 3)
title('acceleration')



%% Computte energy in each waveform using time domain data

Ea = sum(a.*a);
Ev = sum(v.*v);
Ep = sum(p.*p);

N_p = 128; % define maximum points for FFT

% pad waveform with zeros at end 
a_arr = [a, zeros(1, N_p - d_pnts)];
v_arr = [v, zeros(1, N_p - d_pnts)];
p_arr = [p, zeros(1, N_p - d_pnts)];

% take fft
Fa = fftshift(fft(a_arr));
Fv = fftshift(fft(v_arr));
Fp = fftshift(fft(p_arr));

% compute energy from FFT these should match time domain computation
Eat = Fa.*conj(Fa)/N_p; % energy at each point
Eaf = sum(Eat); % total energy
Evt = Fv.*conj(Fv)/N_p;
Evf = sum(Evt);
Ept = Fp.*conj(Fp)/N_p;
Epf = sum(Ept);

n = 1:N_p;
indx = (1:N_p) - N_p/2;  %  zero centered index

%% verify energy values
Ea  % from time domain
Eaf % from frequnecy deomain

Ev
Evf

Ep
Epf


%% plot individual energies vs frequency
figure
subplot(3,1,1)
stem(indx, Eat(n)/Eaf,'r')
title('acceleration energy')
subplot(3,1,2)
stem(indx, Evt(n)/Evf,'g')
title('velocity energy')
subplot(3,1,3)
stem(indx, Ept(n)/Epf,'k')
title('position energy')
xlabel('zero centered bins')
ylabel('normalized energy')



%%  cumulative sum of energy energy band concept
figure
plot(indx,(cumsum(Eat)/Ea),'r', 'linewidth', 2)
hold
plot(indx,(cumsum(Evt)/Ev),'g', 'linewidth', 2)
plot(indx,(cumsum(Ept)/Ep),'k', 'linewidth', 2)
legend('acc', 'vel', 'pos','location', 'nw')
title('cumulative energy density')
axis([-80, 80 -.1 1.1]);
ylabel('normalized energy')
xlabel('normalized frequency')

%% plot overlay of energy
figure
stem(indx, Eat(n)/Eaf,'r', 'filled', 'linewidth', 1)
hold on
stem(indx, Evt(n)/Evf,'g', 'filled', 'linewidth', 1)
stem(indx, Ept(n)/Epf,'k', 'filled', 'linewidth', 1)
title('p,v,a energy spectra')
xlabel('normalized zero centered bins')
ylabel('normalized energy')
legend('acc', 'vel', 'pos',1)
