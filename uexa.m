function [Y]=uexa(X,f_0,B_0,epsilon)
Y = f_0/B_0*(X-(1-exp(B_0/epsilon*X))/(1-exp(B_0/epsilon)));
end 