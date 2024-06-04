function [A]=Matr1DP2(n,epsilon,B_0)
h=1/(n+1);
D=zeros(2*n);
C=zeros(2*n);
for i=1:n+1
if i<=n
D(2*i,2*i+2)=1;
D(2*i+2,2*i)=1;
C(2*i,2*i+2)=-1/2;
C(2*i+2,2*i)=1/2;
end
D(2*i,2*i)=14;
D(2*i-1,2*i-1)=16;
end
D=D(1:end-1,1:end-1);
C=C(1:end-1,1:end-1);
D = D-8*diag(ones(2*n,1),1)-8*diag(ones(2*n,1),-1);
C = C+2*diag(ones(2*n,1),1)-2*diag(ones(2*n,1),-1);
A = epsilon/(3*h)*D+B_0/3*C;
end