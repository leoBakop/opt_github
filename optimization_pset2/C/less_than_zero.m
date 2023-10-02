function [ret] = less_than_zero(x)
ret=0;
[s,~]=size(x);
for i=1:size(x)
    if(x(i)<0)
        ret=1;
    end
end

end

