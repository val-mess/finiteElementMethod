function P1vsP2()

import RHS1DP1.m.* 
import Matr1DP1.m.*
import RHS1DP2.m.* 
import Matr1DP2.m.*
import uexa.m.*


h=[1/16,1/32,1/64,1/128];
n=1./h-1;

%convection dominante 
B_0=1;
f_0=1;
epsilon=[1, 0.001];



for k=1:2
epsilon_i = 0;
if k == 1 ;
epsilon_i = epsilon(1);
A1 = "diffusion";
end
if k == 2 
epsilon_i = epsilon(2);
A1 = "convection";
end

    
figure()
%solution P1
for i=1:4
xi = inv(Matr1DP1(n(i),epsilon_i,B_0))*RHS1DP1(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
subplot(2,1,1)
plot(linspace(1,n(i)+2,n(i)+2),xi_complet);
formatSpec = "tracé de la solution approchée P1 en fonction de n (%s dominante)";
str = sprintf(formatSpec,A1);
title(str)
xlabel('y')
ylabel('n')
if i == 4
legend('h=1/16','h=1/32','h=1/64','h=1/128')
end
end

%solution P2
for i=1:4
xi = inv(Matr1DP2(n(i),epsilon_i,B_0))*RHS1DP2(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
subplot(2,1,2)
plot(linspace(1,2*n(i)+3,2*n(i)+3),xi_complet)
formatSpec = "tracé de la solution approchée P2 en fonction de n (%s dominante)";
str = sprintf(formatSpec,A1);
title(str)
xlabel('y')
ylabel('n')
end

end

end
