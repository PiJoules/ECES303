function X=dft_matrix_no_loops(x)
N=length(x); % Number of data points
m=0:(N-1);
[M1,M2]=meshgrid(m,m.');
n=M1.*M2;
w=exp(-1i*2*pi/N);
W=w.^n;
X=W*x(:);
end