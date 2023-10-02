function [grad] = gradient_SVM_barrier(w,X_augm,y,t)
%GRADIENT_SVM_BARRIER Summary of this function goes here
%   Detailed explanation goes here
[~,n]=size(y);
s=[0;0;0];
for i=(1:n)
   x=X_augm(:,i);
   x_transp=transpose(x);
   s=s+(y(i)*x/(1-y(i)*x_transp*w)); 
end
grad=t*w+s;
end

