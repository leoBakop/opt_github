function [func_val] = f(x,A,b,c)
%func_val= c'*x - sum(log(b - A*x));
func_val= c'*x - log(prod(b - A*x));

end

