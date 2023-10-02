function [func_val] = g(x,A,b,c)
%remember gradient of the sum
%is the sum of the gradient
test=1/(b-A*x);
func_val=c'-sum(test*A);

end

