function [fun_val] = hessian(x,A,b)
%HESS Summary of this function goes here
%   Detailed explanation goes here
b=pinv(b-A*x);
s=sum(A'*A);
scal=b*b';
fun_val=-(scal).*s;

%fun_val=-sum(b*A);
end

