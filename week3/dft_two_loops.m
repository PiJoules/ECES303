function X=dft_two_loops(x)

N=length(x); % Length of x
X=zeros(1,N);

for K=0:(N-1) % Over each K
    X(K+1)=0;
    for n=1:N % Over each x[n]
        X(K+1)=X(K+1)+x(n)*exp(-j*2*pi*K*(n-1)/N);
    end
end

end