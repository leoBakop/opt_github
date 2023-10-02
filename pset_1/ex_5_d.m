clear, clc, close all;
x_1=-5:.1:5;
x_2=x_1;
[~,size]=size(x_1);
[x,y]=meshgrid(x_1,x_2);


for i=1:size
    for j=1:size
        tmp=[x(i,j); y(i,j)];
        f_1(i,j)=norm(tmp);
        f_2(i,j)=norm(tmp)^2;
    end
    
end

figure(1)

subplot(1,2,1)
mesh(x,y,f_1)
title("plot of f_1(x)=norm(x)")

subplot(1,2,2)
mesh(x,y,f_2)
title("plot of f_2(x)=norm(x)^2")
