function [A]=Matr1DP1(n,epsilon,B_0,alpha)
h=1/(n+1);
D=diag(2*ones(1,n))-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1);
C=diag(ones(1,n-1),1)-diag(ones(1,n-1),-1);
A=epsilon/h*D + B_0/2*C;
A=A+alpha*B_0^2/h*D;
end