function [values]=gradient_method_backtracking(x0,s,alpha,...
    beta,epsilon, A,b,c, ampl)
% Gradient method with backtracking stepsize rule
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% x0......... initial point
% s ......... initial choice of stepsize
% alpha ..... tolerance parameter for the stepsize selection
% beta ...... the constant in which the stepsize is multiplied
% at each backtracking step (0<beta<1)
% epsilon ... tolerance parameter for stopping rule
% OUTPUT
%=======================================
% x ......... optimal solution (up to a tolerance)
% of min f(x)
% fun_val ... optimal function value

x=x0;
grad=g(x,A,b,c)';
fun_val=f(x,A,b,c);
iter=0;
mem_g=0;
mem_f=0;
mem_num=5;
j=mem_num;
max_iter=10^5;
i=1;
while (norm(grad)>epsilon)
    iter=iter+1;
    t=s;
    while (fun_val-f(x-t*grad,A,b,c)<alpha*t*norm(grad)^2)
        t=beta*t;
        if(t<10^(-13) && iter<max_iter)
            t=10^(-13);
            break
        elseif(t<10^(-13) &&iter>max_iter)
            values=abs(values-fun_val);
            return
        end
    end
    
    x=x+t*grad;
    d=less_than_zero(b-A*x)==1;
    if(~d) %%just in case to prevent, that x belongs in dom(f)
        fun_val=f(x,A,b,c);
        values(i)=fun_val;
        i=1+i;
        grad=g(x, A,b,c)';
        fprintf('iter_number = %3d norm_grad = %2.32f fun_val = %2.32f and  point is %2.32f, %2.32f\n',...
            iter,norm(grad),fun_val, x(1), x(2));
        norm(grad);
        if(norm(grad)==mem_g && fun_val==mem_f && j>0)
            j=j-1;
        elseif((norm(grad)~=mem_g || fun_val~=mem_f)  && j>0)
            mem_g=norm(grad);
            mem_f=fun_val;
            j=mem_num;
        else %means j==100
            break;
        end
    end
    
end

values=abs(values-fun_val);


end