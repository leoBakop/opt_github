function [ret_val] = f(x,P,q)
ret_val=0.5*x'*P*x+q'*x;
end

