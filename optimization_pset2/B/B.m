close all, clear, clc;
format long
n=2;
%(a)
A=rand(n,n);
[U,S,V]=svd(A);

%(b)
l_min=1; %we choose postive numbers cause we want
K=100;
l_max=K*l_min;
z = l_min + (l_max - l_min) * rand(n - 2, 1);
eig_P=[l_min; l_max; z];
Lamda=diag(eig_P);

%(ii)

P=U*Lamda*U'; %P is positive definite
q=((-1).^(randi([0,1],n,1))).*rand(n,1);

%(iii)
%grad(f)=0 => P*x=-q =>x_opt=-P^(-1)q
x_opt=-inv(P)*q;
p_opt=f(x_opt, P,q)



%(iv)
cvx_begin
    variable x(n)
    minimize(1/2*x'*P*x+q'*x)
cvx_end

%(v)
%exact
ampl=5;
x_initial=ampl*rand(n,1);
g=g(x_initial,P,q);
t_opt=(norm(g)^2)/(g'*P*g);
[x,fun_val, iterations]=gradient_method_exact(x_initial, 10^(-10), t_opt, P,q,ampl);
fprintf('fun_val is %2.16f and was calculated in %d iterations\n', fun_val, iterations);

%backtracking
a=0.2; %a e (0, 0.5)
b=0.1; %b e (0, 1)
[x,fun_val]=gradient_method_backtracking(x_initial, 1, a,b, 10^(-10), P,q,ampl);

%(vi)
mesh_f(ampl,1, P,q)