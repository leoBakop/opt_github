clc, close all, clear;
n=2;
m=20;
%a
A=((-1).^(randi([0,1],m,n))).*rand(m,n);
c=rand(n,1);
b=10*rand(m,1);



cvx_begin
    variable x(n)
    minimize(c'*x-sum(log(b-A*x)))
cvx_end
%b,c
alpha=0.5; %a e (0, 0.5)
beta=0.39; %b e (0, 1)
values_gradient=gradient_method_backtracking([0;0],1,alpha,beta,10^(-15), A,b,c, 5);
contour_f(20,A,b,c,2);
mesh_f(20,A,b,c,1);
%d


values_newton=newton([0;0],1,alpha,beta,10^(-15), A,b,c, 100, n);

figure(3)
subplot(2,1,1)
semilogy(values_gradient)
subplot(2,1,2)
semilogy(values_newton)
