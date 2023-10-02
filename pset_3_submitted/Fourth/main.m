clear all; clc; close all
n=4;
a=((-1).^(randi([0,1],n,1))).*rand(n,1);
b=rand();
x=10*rand(n,1);
L=max_eig(h(x));


[x_pgd,y_pgd,ret_val]=PGD(x,L, a,b, 10^(-5),n);
fprintf('KKT solution as calculated in the first question')

x_opt=b*a/norm(a)^2

minimum=f(x_opt)
%drawing the convex
if n==2
    amp=15;
    x=-amp:.1:amp;
    y=x;
    [x,y]=meshgrid(x,y);
    
    [s,~]=size(x);
    for i=1:s
        for j=1:s
            func(i,j)=f([x(i,j), y(i,j)]);
        end
    end
    
    contour(x,y,func)
    axis([-15,15,-inf,inf])
    hold on
    plot3(x_pgd,y_pgd,ret_val, '--o')
    colorbar
    title('minimizing the ||x||_2^2 using PGD')
    grid on
end