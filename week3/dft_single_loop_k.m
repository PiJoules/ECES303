function X=dft_single_loop_k(x)
N=length(x); % Number of data points
X=zeros(N,1); % Initialize X vector
n=0:(N-1);
for K=0:(N-1) % Loop over K
    X(K+1)=sum(x.*exp(-1i*2*pi*K/N.*n));
end