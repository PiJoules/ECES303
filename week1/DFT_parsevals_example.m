close all;clear all;clc
x=[9 1 2 9 3 4]
Ex=sum(x.^2)
X=dft(x)
EX=1/length(x)*sum(abs(X.^2))