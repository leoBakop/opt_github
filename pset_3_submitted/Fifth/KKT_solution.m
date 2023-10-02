function [ret_val] = KKT_solution(A,P,q,b,n)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % All A,P,q,b are generated     %
    % "randomly" in the previous    %
    % qusestions                    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [~,s_2]=size(A');
    z=zeros(s_2);
    matrix=[P,A';A,z];
    equals=[-q;b];
    solution=linsolve(matrix,equals);
    x_opt=solution(1:n); 
    ret_val=f(x_opt,P,q);
    fprintf('KKT solution is %2.5f\n', ret_val);
end
