function DisplaySolEx()

import uexa.m.*

n = 100;
h = 1/(n+1);
X = linspace(0,1,(n+1));
f_0 = 1;
epsilon = [1, 0.5, 0.1, 0.01];

for i=epsilon
B_0 = -1;
U_exa = uexa(X,f_0,B_0,i);
hold on
plot(X,U_exa)
end

for i=epsilon
B_0 = 1;
U_exa = uexa(X,f_0,B_0,i);
hold on
plot(X,U_exa)
end

legend('B_0=-1, \epsilon=1','B_0=-1, \epsilon=0.5','B_0=-1, \epsilon=0.1','B_0=-1, \epsilon=0.01','B_0=1, \epsilon=1','B_0=1, \epsilon=0.5','B_0=1, \epsilon=0.1','B_0=1, \epsilon=0.01')
xlabel('x')
ylabel('y')
title('affichage de la solution exacte (B_0=cte, f_0=cte=1)')

end
