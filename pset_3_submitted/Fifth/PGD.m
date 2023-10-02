function [x,y,z] = PGD(x_start,L,P,q,A,b,epsilon)
i=1;
x_k=x_start;
while(true)
    x(i)=x_k(1);
    y(i)=x_k(2);
    z(i)=f(x_k,P,q);
    x_temp=x_k-(1/L)*g(x_k,P,q); %gradient step
    v=pinv(A')*(pinv(A)*(A*x_temp-b));
    x_k_plus=x_temp-A'*v; %projection step
    term=norm((x_k_plus-x_k))/norm(x_k_plus) < epsilon;
    if(term)
        break;
    end
    x_k=x_k_plus;
    i=i+1;
end

value=f(x_k,P,q);
   fprintf('iter_number=%3d fun_val = %2.5f \n',...
            i,value);
end

