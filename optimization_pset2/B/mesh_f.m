function [] = mesh_f(amplitude,f_n, P,q)
x_1=-amplitude:0.1:amplitude;
x_2=x_1;

[x,y]=meshgrid(x_1,x_2);
[~,s]=size(x_1);
for i=1:s
    for j=1:s
        func(i,j)=f([x_1(i); x_2(j)], P,q);
    end
end
figure(f_n)
mesh(x,y,func')
end

