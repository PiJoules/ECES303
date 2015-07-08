function X=dft_matrix_1_loop(x)
N=length(x);
w=exp(-2*pi*1i/N);
% Create W matrix
W=zeros(N);
W(1,:)=1;
for K=1:(N-1)
    W(K+1,:)=w.^(0:K:((N-1)*K));
end
X=W*x(:);
end