function [gk] = barrier_SVM_cost_function( w_new, X_augm, y, t )
%BARRIER_SVM_COST_FUNCTION Summary of this function goes here
%   Detailed explanation goes here
[~,n]=size(y);
s=0;
for i=(1:n)
    w_new_tr=transpose(w_new);
    l=log(-(1-y(i)*w_new_tr*X_augm(:,i)));
    s=s+l;
end
phi_w=-s;
gk=0.5*t*norm(w_new)^2+phi_w;
end

