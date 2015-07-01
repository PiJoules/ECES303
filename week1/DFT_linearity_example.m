
function x=idft(X)
N=length(X);
x=zeros(1,length(X));
K=zeros(,lengthh(X));
for n=0:(N-1)
    for k=0:(N-1)
        K=X(K+1)*exp(j*2*pi*k*n/N);
    end
    x(n+1)=sum(K)/N;
end
end