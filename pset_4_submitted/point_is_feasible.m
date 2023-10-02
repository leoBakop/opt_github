function flag = point_is_feasible(w,X_augm,y)
%POINT_IS_FEASIBLE Summary of this function goes here
%   Detailed explanation goes here
[~,n]=size(y);

flag=1;
for i=(1:n)
    z=transpose(w);
    value=(1-y(i).*z.*X_augm(:,i));
    if(value>0)
        flag=0;
        return;
    end
end

end

