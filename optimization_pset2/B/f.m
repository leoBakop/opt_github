function [f_value] = f(x, P,q)
f_value=(x)'*P*(x) +q'*(x);
end

