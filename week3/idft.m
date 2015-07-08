function x=idft(X)
N=length(X);
x=zeros(1,length(X));
K=zeros(1,length(X));
for n=0:(N-1)
for k=0:(N-1)
K(k+1)=X(k+1)*exp(j*2*pi*k*n/N);
end
x(n+1)=sum(K)/N;
end
end