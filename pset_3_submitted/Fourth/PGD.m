function [x,y,z] = PGD(x_start,L, a,b, epsilon,n)
i=1;
x_k=x_start;

while(true)
   x(i)=x_k(1);
   y(i)=x_k(2);
   z(i)=f(x_k);
   x_temp=x_k-(1/L)*g(x_k); %gradient step
   x_k_plus=x_temp-((a'*x_temp-b)/norm(a)^2)*a; %projection step
   %when denominator is norm(x_k), the algorith uses more (couple) iterations 
   term=norm((x_k_plus-x_k))/norm(x_k_plus) < epsilon;
   if(term)
       break;
   end
   x_k=x_k_plus;
   i=i+1;
   
end
value=f(x_k);
if n==4
fprintf('iter_number = %3d fun_val = %2.4f and  point is %2.4f, %2.4f, %2.4f, %2.4f\n',...
            i,value, x_k(1), x_k(2), x_k(3), x_k(4)); %if n=4
elseif n==2
fprintf('iter_number = %3d fun_val = %2.4f and  point is %2.4f, %2.4f\n',...
           i,value, x_k(1), x_k(2)); %if n=2

end

