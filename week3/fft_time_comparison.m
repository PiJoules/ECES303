close all;clear all;clc
% Load in function to keep computations good
x=(1:8).';
X=dft_two_loops(x).';
X=dft_single_loop_k(x.');
X=dft_single_loop_n(x.');
X=fft(x);

N=12;
n=1:N;
nn=2.^n;
times=zeros(N,4);
num_loops=10;
T=times;
for loops=1:num_loops
    loops
    for k=1:N
        %k
        x1=1:(2^k);
        x2=x1';
        
        ticIDa=tic;
        X=dft_two_loops(x2);
        Tel_a=toc(ticIDa);
        
        ticIDb=tic;
        X=dft_single_loop_k(x1);
        Tel_b=toc(ticIDb);
        
        ticIDc=tic;
        X=dft_single_loop_n(x1);
        Tel_c=toc(ticIDc);
        
        ticIDd=tic;
        X=fft(x2);
        Tel_d=toc(ticIDd);
        
        times(k,:)=[Tel_a Tel_b Tel_c Tel_d];
    end
    T=T+times/num_loops;
end
figure
plot(nn,T,'o')
xlabel('Number of Data Points')
ylabel('Time (s)')
legend('Two Loops','Single Loop over K','Single Loop Over n','FFT',0)
xlim([0 max(nn)])