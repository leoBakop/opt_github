function [values] = newton(x0,s,alpha,...
    beta,epsilon, A,b,c, ampl, n)
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
%in newton function, i am gonna use the
%back tracking method, but instead of the
%first order realated reduce of the x
%i will use a second order

x=x0;
grad=g(x,A,b,c)';
fun_val=f(x,A,b,c);
iter=0;
mem=0;
j=100;
lambda=-1;
outside_dom=0;
i=1;
while (lambda<2*epsilon)
    iter=iter+1;
    t=s;
    while (fun_val-f(x-t*grad,A,b,c)<alpha*t*norm(grad)^2)
        t=beta*t;
        if(t<10^(-250))
            t=10^(-(randi(10)))*randn;
            break;
        end
    end
    
    grad=g(x,A,b,c)';
    h=hessian(x,A,b);
    x=x+t.*h*grad;
    if(outside_dom>10)
        fprintf('restart')
        x=0.*x;
    end
    
    if(dom(A,b,x)==1) %%just in case to prevent, that x belongs in dom(f)
        outside_dom=0;
        
        lambda=(grad'*h').*grad;
        fun_val=f(x,A,b,c);
        grad=g(x, A,b,c)';
        values(i)=fun_val;
        i=1+i;
        if(norm(grad)==mem && j>0)
            j=j-1;
        elseif(norm(grad)~=mem && j>0)
            mem=norm(grad);
            j=100;
        else %means j==100
            break;
        end
    else
        outside_dom=outside_dom+1;
    end
   
end
fprintf("Newton's method")
fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.32f  and optimal point is %2.32f, %2.32f \n',...
            iter,norm(grad),fun_val, x(1), x(2));
values=abs(values-fun_val);

end

