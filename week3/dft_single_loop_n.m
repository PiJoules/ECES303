function X=dft_single_loop_n(x)
N=length(x); % Number of data points
X=zeros(N,1); % Initialize X vector
k_vector=(0:(N-1)).';
for nn=0:(N-1)
    X=X+x(nn+1)*exp(-1i*2*pi*k_vector*nn/N);
end