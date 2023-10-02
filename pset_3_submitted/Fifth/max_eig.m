function [ret_val] = max_eig(x)
values=eig(x);
ret_val=max(values);
end

