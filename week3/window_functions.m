%% windowing functions
% modified 7/9/2012
% Dr. Tom Chmielewski
L  = 50; % for display

wb  = window(@blackmanharris,L);
wham = window(@hamming,L);
wh = window(@hann,L);
wg = window(@gausswin,L,2.5);
wr = window(@rectwin, L);
%% plot time domain windowing functions
figure
plot(1:L,[wb,wh, wham, wg, wr], 'linewidth', 2); axis([-1 L+1 0 1.5]);
legend( 'Blackman-Harris','Hann', 'Hamming','Gaussian', 'rectangular');
title('windowing functions for L = 100')
title('time domain windowing functions')

%% frequency domain functions

N = 1024

%  magnitude spectrum

WB = fftshift(fft(wb,N));
WH = fftshift(fft(wham,N));
WHam = fftshift(fft(wh,N));
WG = fftshift(fft(wg,N));
WR = fftshift(fft(wr,N));
w = [-N/2:(N/2-1)]*2*pi/N;

figure
plot(w, abs(WB))
title( 'Blackman-Harris');

figure
plot(w, abs(WHam))
title('Hamming');

figure
plot(w, abs(WH))
title('Hann');

figure
plot(w, abs(WG))
title('Gaussian');

figure
plot(w, abs(WR))
title('rectangular');