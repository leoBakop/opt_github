function [Hess] = Hess_SVM_barrier(w,X_augm,y,t)
%HESS_SVM_BARRIER Summary of this function goes here
%   Detailed explanation goes here
[~,n]=size(y);
s=0*ones(3);
for i=(1:n)
   x=X_augm(:,i);
   x_transp=transpose(x);
   s=s+(x*x_transp/(y(i)*x_transp*w-1)^2); 
end
Hess=t*eye(3)+s;
end

