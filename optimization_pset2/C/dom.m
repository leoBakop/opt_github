function [belongsInDom] = dom(A,b,x)
belongsInDom=0;
tmp=b-A*x;
[s,~]=size(tmp);
for i=1:s
    if(tmp(i)<0)
        belongsInDom=(mod(belongsInDom+1,2));
    end
end

belongsInDom=(mod(belongsInDom+1,2)); %jsut because this function needs to return 1 in case of the A,b,x
%are suitable for f and 0 if aren't
end

