function Xk=dft(x)
N=0:(length(x)-1);
Xk=zeros(1,length(x)-1);
X=zeros(1,length(x)-1);
for k=0:(N-1)
    for n=0:(N-1)
        X(n+1)=x(n+1)*exp(-j*2*pi*k*n/N);
    end
    Xk(k)=sum(X);
end
end