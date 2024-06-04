function SolhVsSolEx()

import RHS1DP1.m.* 
import Matr1DP1.m.*
import uexa.m.*

h=[1/16,1/32,1/64,1/128];
n=1./h-1;

B_0=1;
f_0=1;
epsilon=[0.1,1];

for e=epsilon
figure()
for i=1:4
X = linspace(0,1,n(i)+2);
xi = inv(Matr1DP1(n(i),e,B_0))*RHS1DP1(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
if i==4 
plot(X,xi_complet,linspace(0,1,1000),uexa(linspace(0,1,1000),f_0,B_0,e));
else
plot(X,xi_complet)
end
end

formatSpec = "tracé de la solution exacte et approchée pour epsilon=%f, \n pour 4 paramètres de discrétisation h donnés";
A1 = e;
str = sprintf(formatSpec,A1);
legend('h=1/16','h=1/32','h=1/64','h=1/128','SolEx, calculée en 1000 points')
xlabel('x')
ylabel('y')
title(str)

end



end
