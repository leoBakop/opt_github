function [x,fun_val]=gradient_method_backtracking(x0,s,alpha,...
    beta,epsilon, P,q, ampl)
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
contour_f(ampl, 2, P, q);

x=x0;
grad=g(x,P,q);
fun_val=f(x, P,q);
iter=0;
mem=0;
j=100;
i=1;
while (norm(grad)>epsilon)
    iter=iter+1;
    t=s;
    while (fun_val-f(x-t*grad, P,q)<alpha*t*norm(grad)^2)
        t=beta*t;
    end
    x_1_over(i)=x(1);
    x_2_over(i)=x(2);
    i=i+1;
    x=x-t*grad;
    fun_val=f(x,P,q);
    grad=g(x, P, q);
    fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.32f \n',...
        iter,norm(grad),fun_val);
    norm(grad);
    if(norm(grad)==mem && j>0)
        j=j-1;
    elseif(norm(grad)~=mem && j>0)
        mem=norm(grad);
        j=100;
    else %means i==100
        break;
    end
    
    
end
plot(x_1_over, x_2_over, '--o')
hold off;
%%question vi
[~,s]=size(x_1_over);
x_1=0:.1:s/10 -0.1;
figure(5)
for i=1:s
    log_c(i)=log(f([x_1_over(i); x_2_over(i)],P,q)-fun_val); %complex due to negative values of argument
end
plot(x_1, log_c)
    
end