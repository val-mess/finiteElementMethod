function SolStabP1()

import RHS1DP1SUPG.m.* 
import Matr1DP1SUPG.m.*
import uexa.m.*

h=[1/32,1/64,1/128];
n=1./h-1;

B_0=1;
f_0=1;
e=0.01;
alpha=0;
gamma=0;

for i=1:3
gamma=B_0*h(i)/e;
if gamma < 6
alpha=gamma*h(i)/(12*B_0);
else
alpha=h(i)/(2*B_0);
end
X = linspace(0,1,n(i)+2);
xi = inv(Matr1DP1SUPG(n(i),e,B_0,alpha))*RHS1DP1SUPG(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
if i==3
plot(X,xi_complet,linspace(0,1,1000),uexa(linspace(0,1,1000),f_0,B_0,e));
else
plot(X,xi_complet)
end
end

formatSpec = "tracé de la solution exacte et approchée (stabilisée) pour epsilon=0.01, \n pour 3 paramètres de discrétisation h donnés";
A1 = e;
str = sprintf(formatSpec,A1);
legend('h=1/32','h=1/64','h=1/128','SolEx, calculée en 1000 points')
xlabel('x')
ylabel('y')
title(str)
