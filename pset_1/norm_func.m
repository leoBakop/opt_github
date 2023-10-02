function [norm] = norm_func(vector)
%NORM_FUNC Summary of this function goes here
%   Detailed explanation goes here
[s ,~]=size(vector);
norm =0;
for i=1:s
    norm=norm+vector(i)^2;
end

