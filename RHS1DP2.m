function [b]=RHS1DP2(n,f_0)
h=1/(n+1);
b=zeros(2*n+1,1);
for i=1:n+1
b(2*i)=1;
b(2*i-1)=2;
end
b=b(1:end-1);
b=f_0*h/3*b;
end