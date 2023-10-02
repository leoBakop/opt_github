function [] = mesh_f(ampl, A,b,c, f_n)
x_1=-ampl:.1:ampl;
x_2=x_1;

[x,y]=meshgrid(x_1,x_2);

[~,s]=size(x);

for i=1:s
    for j=1:s
        tmp=[x_1(i); x_2(j)];
        if(b-A*tmp>0)
            func(i,j)=f(tmp, A, b,c);
        else
            func(i,j)=10^2;
        end
    end
end
figure(f_n)
mesh(x, y, func')

end

