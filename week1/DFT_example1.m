close all;clear all;clc
x=[1 2 2 1];
N=length(x);
X=zeros(1,length(x));
Xk=zeros(1,length(x));
for k=0:N-1
    for n=0:N-1
        X(n+1)=x(n+1)*exp(-j*2*pi*k*n/N);
    end
    Xk(k+1)=sum(X);
end
figure
subplot(2,1,1)
stem(0:N-1,abs(Xk),'filled')
xlim([-.5 3.5])
ylim([-0.5 6.5])
xlabel('k')
ylabel('|X_k|')
subplot(2,1,2)
stem(0:N-1,angle(Xk),'filled')
xlim([-.5 3.5])
ylim([-3.5 3])
xlabel('k')
ylabel('\angleX_k (radians)')
