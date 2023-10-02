clc, clear, close all
A=10*rand(3,2);
X=10*rand(2,1);
b=A*X;

a_1=X(1);
b_1=X(2);

x_1=0:.1:2*a_1;
x_2=0:.1:2*b_1;

[x,y]=meshgrid(x_1,x_2);


[size_1,size_2]=size(x);

for i=1:size_1
    for j=1:size_2
        tmp=[x(i,j); y(i,j)];
        f(i,j)=norm(A*tmp-b)^2;
    end
end

figure(1)
mesh(x,y,f);
figure(2)
contour(x,y,f)

