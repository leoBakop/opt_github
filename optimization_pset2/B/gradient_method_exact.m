function [x,fun_val, iterations] = gradient_method_exact(x_initial, epsilon, t_opt, P, q, ampl)
%GRADIENT_METHOD_EXACT Summary of this function goes here
%inputs:
%f: the function thatis going to be minimized
%g: the gradient of the f
%epsilon: threshold, rellevant zero
contour_f(ampl, 3, P, q);
k=0;
x=x_initial;
grad=g(x, P, q);
i=1;
%t_opt was calculated outside this function
while norm(grad)>epsilon
    x_1_over(i)=x(1);
    x_2_over(i)=x(2);
    i=i+1;
    D_x=-grad;
    x=x+t_opt*D_x; %new value of x
    k=k+1; %counter for the iterations
    grad=g(x,P,q);
end
plot(x_1_over, x_2_over, '--o')
fun_val=f(x, P, q);
iterations=k;
hold off;
%%question vi
[~,s]=size(x_1_over);
x_1=0:.1:s/10 -0.1;
figure(4)
for i=1:s
    log_c(i)=log(f([x_1_over(i); x_2_over(i)],P,q)-fun_val); %complex due to negative values of argument
end
plot(x_1, log_c)


end

