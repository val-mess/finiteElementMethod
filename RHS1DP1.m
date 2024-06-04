function [b]=RHS1DP1(n,f_0)
h=1/(n+1);
b=f_0*h*ones(n,1);
end
