close all;clear all;clc
% Load in function to keep computations good
x=(1:8).';
X=dft_two_loops(x).';
X=dft_single_loop_k(x.');
X=dft_single_loop_n(x.');
X=dft_matrix_1_loop(x);
X=dft_matrix_no_loops(x);

N=512;
times=zeros(N-1,5);
num_loops=10;
T=times;
for loops=1:num_loops
    loops
    for k=2:N
        %k
        x1=1:k;
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
        X=dft_matrix_1_loop(x2);
        Tel_d=toc(ticIDd);
        
        ticIDe=tic;
        X=dft_matrix_no_loops(x2);
        Tel_e=toc(ticIDe);
        
        times(k-1,:)=[Tel_a Tel_b Tel_c Tel_d Tel_e];
    end
    T=T+times/num_loops;
end
figure
plot(2:N,T)
xlabel('Number of Data Points')
ylabel('Time (s)')
legend('Two Loops','Single Loop over K','Single Loop Over n','Matrix-1 loop','Matrix-No Loops',0)
xlim([0 N])