clc; clear all; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    The above section,                     %
%    first implemented in second Pset       %
%    and creates a positive definite matrix %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=4;
p=n-1; %using p<n in order to create a full rank A matrix
A=rand(n,n);
[U,S,V]=svd(A);

l_min=1; %we choose postive numbers cause we want
K=3;
l_max=K*l_min;
z = l_min + (l_max - l_min) * rand(n - 2, 1);
eig_P=[l_min; l_max; z];
Lamda=diag(eig_P);


P=U*Lamda*U'; %P is positive definite
q=((-1).^(randi([0,1],n,1))).*rand(n,1);
%%creating matrices for the costraint

A=randn(p,n); %creates a p,n table with rank p
b=((-1).^(randi([0,1],p,1))).*rand(p,1);
%%beginning of the solution proccess
%%cvx part
cvx_begin
variable x(n)
minimize( 0.5*x'*P*x+q'*x)
subject to
A*x == b;
cvx_end

%%solving using the kkt
KKT_solution(A,P,q,b,n);
%%solving using projected gradient descent
amp=10;
x_start=(amp-2)*randn(n,1);
L=max_eig(h(x_start,P,q));
fprintf('PGD solution\n')
[x_pgd, y_pgd, retval]=PGD(x_start,L,P,q,A,b,10^(-5));

%drawing convex and its solution
if n==2
    x_1=-amp:.1:amp;
    x_2=x_1;
    [x,y]=meshgrid(x_1,x_2);
    [s_1,~]=size(x);
    
    for i=1:s_1
        for j=1:s_1
            func(i,j)=f([x(i,j); y(i,j)], P,q);
        end
    end
    
    figure(1)
    contour(x,y,func);
    hold on
    plot3(x_pgd,y_pgd,retval, '--o')
    colorbar
    title('minimizing the quadratic for n=2')
    grid on
    axis([-amp, amp, -amp,amp])
end

