function P1StabvsP1()

import RHS1DP1.m.* 
import Matr1DP1.m.*
import RHS1DP1SUPG.m.* 
import Matr1DP1SUPG.m.*
import uexa.m.*


h=[1/16,1/32,1/64,1/128];
n=1./h-1;

%convection dominante 
B_0=1;
f_0=1;
e=0.01;

    
figure()
%solution P1
for i=1:4
xi = inv(Matr1DP1(n(i),e,B_0))*RHS1DP1(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
subplot(2,1,1)
plot(linspace(1,n(i)+2,n(i)+2),xi_complet);
title("tracé de la solution approchée P1 en fonction de n (convection dominante)")
xlabel('y')
ylabel('n')
if i == 4
legend('h=1/16','h=1/32','h=1/64','h=1/128')
end
end

alpha=0;
gamma=0;
%solution P1 stabilisée 
for i=1:4
gamma=B_0*h(i)/e;
if gamma < 6
alpha=gamma*h(i)/(12*B_0);
else
alpha=h(i)/(2*B_0);
end
xi = inv(Matr1DP1SUPG(n(i),e,B_0,alpha))*RHS1DP1SUPG(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
subplot(2,1,2)
plot(linspace(1,n(i)+2,n(i)+2),xi_complet)
title("tracé de la solution approchée P1 stabilisée en fonction de n (convection dominante)")
xlabel('y')
ylabel('n')
end


end